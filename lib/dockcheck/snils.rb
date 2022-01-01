# frozen_string_literal: true

require "#{__dir__}/dockhelper.rb"

class DockCheck::Snils
  @@coefficients_map = [9, 8, 7, 6, 5, 4, 3, 2, 1]

  def self.check(document)
    snils = DockHelper.numberize_document(document[:content])

    case snils.count
    when 11
      last_digits = document[:content].slice(9, 10).to_i
      document[:correct] = snils_valid?(snils, last_digits)
    else
      document[:error] = 'Incorrect snils numbers count!'
    end

    document
  end

  def self.name
    :snils
  end

  private

  def self.control_sum_calc(inn, coefficients)
    inn
      .zip(coefficients)
      .filter { |(a, b)| !b.nil? }
      .reduce(0) { |acc, (a, b)| a * b + acc }
  end

  def self.check_control_sum(control_sum)
    return control_sum if control_sum < 100
    return 0 if control_sum == 100

    rem = control_sum % 101
    rem == 100 ? 0 : rem
  end

  def self.snils_valid?(snils, last_digits)
    control_sum = control_sum_calc(snils, @@coefficients_map)
    last_digits == check_control_sum(control_sum)
  end
end
