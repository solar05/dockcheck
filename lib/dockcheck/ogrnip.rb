# frozen_string_literal: true

require "#{__dir__}/dockhelper.rb"

class DockCheck::Ogrnip
  def self.check(document)
    validate_ogrnip(document)
    document
  end

  def self.name
    :ogrnip
  end

  def self.ogrnip_valid?(ogrnip)
    first_code = ogrnip[0..13].to_i
    second_code = (first_code / 13).floor * 13
    result_sum = (first_code - second_code) % 10
    result_sum == ogrnip[14].to_i
  end

  def self.validate_ogrnip(data)
    ogrnip = data[:content]
    case ogrnip.length
    when 15
      data[:correct] = DockHelper.only_digits?(ogrnip) ? ogrnip_valid?(ogrnip) : false
    else
      data[:error] = 'Incorrect ogrnip numbers count!'
    end
  end
end
