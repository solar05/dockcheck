# frozen_string_literal: true

require "#{__dir__}/dockhelper.rb"

class DockCheck::Inn
  @@ten_digits_map = [2, 4, 10, 3, 5, 9, 4, 6, 8]
  @@twelve_digits_first_map = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
  @@twelve_digits_second_map = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]

  def self.check(document)
    inn = DockHelper.numberize_document(document[:content])

    case inn.count
    when 10
      document[:correct] = ten_digit_inn_valid?(inn)
    when 12
      document[:correct] = twelve_digit_inn_valid?(inn)
    else
      document[:error] = 'Incorrect inn numbers count!'
    end

    document
  end

  def self.name
    :inn
  end

  private

  def self.control_sum_calc(inn, coefficients)
    inn
      .zip(coefficients)
      .filter { |(a, b)| !b.nil? }
      .reduce(0) { |acc, (a, b)| a * b + acc }
  end

  def self.sum_div(number)
    number % 11 % 10
  end

  def self.ten_digit_inn_valid?(inn)
    last_number = inn.last
    control_sum = control_sum_calc(inn, @@ten_digits_map)
    last_number == sum_div(control_sum)
  end

  def self.twelve_digit_inn_valid?(inn)
    last_number = inn.last
    penult_number = inn.fetch(10)

    first_sum = control_sum_calc(inn, @@twelve_digits_first_map)
    second_sum = control_sum_calc(inn, @@twelve_digits_second_map)

    penult_number == sum_div(first_sum) && last_number == sum_div(second_sum)
  end
end
