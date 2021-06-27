# frozen_string_literal: true

class DockCheck
  @current_checker

  def initialize(checker = :inn)
    dispatch(checker)
    self
  end

  def check(numbers, *other_data)
    @current_checker.check(numbers, *other_data)
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
    checkers_map = {inn: Inn, snils: Snils, bik: Bik, kpp: Kpp}

    if checkers_map.key?(checker.to_sym)
      @current_checker = checkers_map[checker].new
    else
      raise 'Incorrect checker!'
    end
  end
end

Dir[File.join(__dir__, 'dockcheck', '*.rb')].each { |file| require file }

