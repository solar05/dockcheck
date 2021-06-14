# frozen_string_literal: true

class DockCheck::Inn
  def check(numbers)
    inn = prepare_inn(numbers)
    case inn.count
    when 10
      ten_digit_inn_valid?(inn)
    when 12
      twelve_digit_inn_valid?(inn)
    else
      raise 'Incorrent inn numbers count!'
    end
  end

  private
  def prepare_inn(numbers)
    numbers.split('')
  end

  def ten_digit_inn_valid?(inn)
    true
  end

  def twelve_digit_inn_valid?(inn)
    true
  end
end
