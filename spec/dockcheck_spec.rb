require 'spec_helper'

RSpec.describe DockCheck do
  let(:checker) { DockCheck.new(:snils) }

  it 'check and swaps correctly' do
    expect(checker.check("12345678911", [])).to be false

    checker.change_checker(:snils)

    expect(checker.check("12345434343", [])).to be false
  end

  it 'return name of current checker' do
    expect(checker.current_checker).to be :snils
  end
end
