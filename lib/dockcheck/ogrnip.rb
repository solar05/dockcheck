# frozen_string_literal: true

class DockCheck::Ogrnip

  def check(ogrnip, _)
    case ogrnip.length
    when 15
      if only_digits?(ogrnip)
        ogrnip_valid?(ogrnip)
      else
        false
      end
    else
      raise StandardError.new 'Incorrect ogrnip numbers count!'
    end
  end

  def name
    :ogrnip
  end

  private

  def only_digits?(ogrnip)
    ogrnip.scan(/\D/).empty?
  end

  def ogrnip_valid?(ogrnip)
    first_code = ogrnip[0..13].to_i
    second_code = (first_code / 13).floor * 13
    result_sum = (first_code - second_code) % 10
    result_sum == ogrnip[14].to_i
  end
end