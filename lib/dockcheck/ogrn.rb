# frozen_string_literal: true

require "#{__dir__}/dockhelper.rb"

class DockCheck::Ogrn

  def self.check(ogrn, _)
    case ogrn.length
    when 13
      if DockHelper.only_digits?(ogrn)
        ogrn_valid?(ogrn)
      else
        false
      end
    else
      raise StandardError.new 'Incorrect ogrn numbers count!'
    end
  end

  def self.name
    :ogrn
  end

  private

  def self.ogrn_valid?(ogrn)
    first_code = ogrn[0..12].to_i
    second_code = (first_code / 11).floor * 11
    result_sum = (first_code - second_code) % 10
    result_sum == ogrn[13].to_i
  end
end
