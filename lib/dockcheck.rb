class DockCheck
  @current_checker

  def initialize(checker = :inn)
    dispatch(checker)
    self
  end

  def check(doc)
    @current_checker.check(doc)
  end

  def change_checker(checker)
    dispatch(checker)
    self
  end

  private
  def dispatch(checker)
    checkers_map = {inn: Inn}

    if checkers_map.key?(checker.to_sym)
      @current_checker = checkers_map[checker].new
    else
      raise 'Incorrect checker!'
    end
  end
end

require 'dockcheck/inn'

