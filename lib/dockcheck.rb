# frozen_string_literal: true

class DockCheck
  def initialize
    @checkers_map = { inn: Inn, snils: Snils, bik: Bik, kpp: Kpp, ogrnip: Ogrnip, ogrn: Ogrn }
  end

  def check(data)
    document = DockHelper.prepare_doc(data)
    check_doc(document)
  end

  def check_many(documents)
    documents.each do |document|
      doc = DockHelper.prepare_doc(document)
      check_doc(doc)
    end
  end

  def list_checkers
    @checkers_map.map { |checker| checker.last.name }
  end

  private

  def check_doc(doc)
    checker = doc[:type]
    result = doc

    unless checker
      result[:error] = 'Document type field required!'
      return result
    end

    if @checkers_map.key?(checker.to_sym)
      result = check_control_sum(result)
    else
      result[:error] = 'Incorrect checker!'
    end

    result
  end

  def check_control_sum(data)
    if data[:content]
      @checkers_map[data[:type]].check(data)
    else
      data[:error] = 'Content field required!'
      data
    end
  end
end

Dir[File.join(__dir__, 'dockcheck', '*.rb')].sort.each { |file| require file }
