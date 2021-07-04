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

  it 'check multiple documents correctly' do
    expect(checker.check_many([{type: :inn, content: "7743013901", extra: ""}, {type: :bik, content: "123456?!@", extra: ""}])).to eq [{type: :inn, content: "7743013901", extra: "", correct: true}, {type: :bik, content: "123456?!@", extra: "", correct: false}]
  end
end
