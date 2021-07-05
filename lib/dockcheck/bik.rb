# frozen_string_literal: true

require "#{__dir__}/dockhelper.rb"

class DockCheck::Bik

  def self.check(document)
    bik = document[:content]

    case bik.length
    when 9
      document[:correct] = DockHelper.only_digits?(bik)
    else
      document[:error] = 'Incorrect bik numbers count!'
    end

    document
  end

  def self.name
    :bik
  end

end
