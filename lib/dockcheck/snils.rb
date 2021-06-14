# frozen_string_literal: true

class DockCheck::Snils
  @@coefficients_map = [9, 8, 7, 6, 5, 4, 3, 2, 1]

  def check(numbers)
    snils = prepare_snils(numbers)
    case snils.count
    when 11
      last_digits = numbers.slice(9, 10).to_i
      snils_valid?(snils, last_digits)
    else
      raise StandardError.new 'Incorrect snils numbers count!'
    end
  end

  private
  def prepare_snils(numbers)
    numbers.split('').map { |n| n.to_i }
  end

  def control_sum_calc(inn, coefficients)
    inn
      .zip(coefficients)
      .filter { |(a, b)| !b.nil? }
      .reduce(0) { |acc, (a, b)| a * b + acc }
  end

  def check_control_sum(control_sum)
    if control_sum < 100
      control_sum
    elsif control_sum == 100
      0
    else
      rem = control_sum % 101
      rem == 100 ? 0 : rem
    end
  end

  def snils_valid?(snils, last_digits)
    control_sum = control_sum_calc(snils, @@coefficients_map)
    last_digits == check_control_sum(control_sum)
  end
end
