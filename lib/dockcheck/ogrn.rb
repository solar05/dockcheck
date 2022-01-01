# frozen_string_literal: true

require "#{__dir__}/dockhelper.rb"

class DockCheck::Ogrn
  def self.check(document)
    ogrn = document[:content]

    case ogrn.length
    when 13
      document[:correct] = DockHelper.only_digits?(ogrn) ? ogrn_valid?(ogrn) : false
    else
      document[:error] = 'Incorrect ogrn numbers count!'
    end

    document
  end

  def self.name
    :ogrn
  end

  def self.ogrn_valid?(ogrn)
    first_code = ogrn[0..12].to_i
    second_code = (first_code / 11).floor * 11
    
    result_sum = (first_code - second_code) % 10
    result_sum == ogrn[13].to_i
  end
end
