# frozen_string_literal: true

require "#{__dir__}/dockhelper.rb"

class DockCheck::Ogrnip

  def self.check(document)
    ogrnip = document[:content]

    case ogrnip.length
    when 15
      document[:correct] =
        if DockHelper.only_digits?(ogrnip)
          ogrnip_valid?(ogrnip)
        else
          false
        end
    else
      document[:error] = 'Incorrect ogrnip numbers count!'
    end

    document
  end

  def self.name
    :ogrnip
  end

  private

  def self.ogrnip_valid?(ogrnip)
    first_code = ogrnip[0..13].to_i
    second_code = (first_code / 13).floor * 13
    result_sum = (first_code - second_code) % 10
    result_sum == ogrnip[14].to_i
  end
end
