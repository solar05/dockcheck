# frozen_string_literal: true

class DockCheck::Bik

  def check(bik, _)
    case bik.length
    when 9
      bik_valid?(bik)
    else
      raise StandardError.new 'Incorrect bik numbers count!'
    end
  end

  def name
    :bik
  end

  private

  def bik_valid?(bik)
    bik.scan(/\D/).empty?
  end
end
