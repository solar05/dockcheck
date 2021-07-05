# frozen_string_literal: true

class DockCheck::Kpp

  def self.check(kpp, _)
    case kpp.length
    when 9
      kpp_valid?(kpp)
    else
      raise StandardError.new 'Incorrect kpp numbers count!'
    end
  end

  def self.name
    :kpp
  end

  private

  def self.kpp_valid?(kpp)
    !!(kpp =~ /^[0-9]{4}[0-9A-Z]{2}[0-9]{3}$/)
  end
end
