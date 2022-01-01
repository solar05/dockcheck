# frozen_string_literal: true

class DockCheck::Kpp
  def self.check(document)
    kpp = document[:content]

    case kpp.length
    when 9
      document[:correct] = kpp_valid?(kpp)
    else
      document[:error] = 'Incorrect kpp numbers count!'
    end

    document
  end

  def self.name
    :kpp
  end

  def self.kpp_valid?(kpp)
    !!(kpp =~ /^[0-9]{4}[0-9A-Z]{2}[0-9]{3}$/)
  end
end
