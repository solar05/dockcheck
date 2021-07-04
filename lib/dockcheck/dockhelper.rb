# frozen_string_literal: true

class DockHelper

  def self.numberize_document(numbers)
    numbers.split('').map(&:to_i)
  end

  def self.only_digits?(document)
    document.scan(/\D/).empty?
  end

end
