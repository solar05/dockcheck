# frozen_string_literal: true

require "#{__dir__}/dockhelper.rb"

class DockCheck::Bik

  def check(bik, _)
    case bik.length
    when 9
      DockHelper.only_digits?(bik)
    else
      raise StandardError.new 'Incorrect bik numbers count!'
    end
  end

  def name
    :bik
  end

end
