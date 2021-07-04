# frozen_string_literal: true

class DockCheck
  @current_checker
  @checkers_map

  def initialize(checker = :inn)
    @checkers_map = {inn: Inn, snils: Snils, bik: Bik, kpp: Kpp, ogrnip: Ogrnip, ogrn: Ogrn}
    dispatch(checker)
    self
  end

  def check(numbers, *other_data)
    @current_checker.check(numbers, *other_data)
  end

  def check_many(documents)
    documents.each do |document|
      checker = document[:type]
      doc = document[:content]
      extra = document[:extra]
      document[:correct] = @checkers_map[checker].new.check(doc, extra)
    end
  end

  def change_checker(checker)
    dispatch(checker)
    self
  end

  def current_checker
    @current_checker.name()
  end

  private
  def dispatch(checker)
    if @checkers_map.key?(checker.to_sym)
      @current_checker = @checkers_map[checker].new
    else
      raise 'Incorrect checker!'
    end
  end
end

Dir[File.join(__dir__, 'dockcheck', '*.rb')].each { |file| require file }
