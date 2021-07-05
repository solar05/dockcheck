# frozen_string_literal: true

class DockCheck
  @checkers_map

  def initialize()
    @checkers_map = {inn: Inn, snils: Snils, bik: Bik, kpp: Kpp, ogrnip: Ogrnip, ogrn: Ogrn}
    self
  end

  def check(data)
    doc = DockHelper.prepare_doc(data)
    checker = doc[:type]
    result = doc

    if checker
      if @checkers_map.key?(checker.to_sym)
        if doc[:content]
          result = @checkers_map[checker].check(doc)
        else
          result[:error] = 'Content field required!'
        end
      else
        result[:error] = 'Incorrect checker!'
      end
    else
      result[:error] = 'Document type field required!'
    end

    result
  end

  def check_many(documents)
    documents.each do |document|
      checker = document[:type]
      doc = DockHelper.prepare_doc(document)
      @checkers_map[checker].check(doc)
    end
  end

  def list_checkers
    @checkers_map.map { |checker| checker.last.name }
  end

end

Dir[File.join(__dir__, 'dockcheck', '*.rb')].each { |file| require file }
