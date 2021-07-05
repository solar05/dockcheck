# frozen_string_literal: true

class DockHelper

  def self.numberize_document(numbers)
    numbers.split('').map(&:to_i)
  end

  def self.only_digits?(document)
    document.scan(/\D/).empty?
  end

  def self.prepare_doc(doc)
    new_data = doc
    new_data[:correct] = false
    new_data[:error] = ""
    new_data
  end

end
