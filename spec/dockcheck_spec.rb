require 'spec_helper'

RSpec.describe DockCheck do
  let(:checker) { DockCheck.new() }

  it 'check and swaps correctly' do
    expect(checker.check({type: :inn, content: "7743013901"})).to eq({type: :inn, content: "7743013901", error: "", correct: true})

    expect(checker.check({type: :snils, content: "12345678901"})).to eq({type: :snils, content: "12345678901", correct: false, error: ""})
  end

  it 'return list of checkers name' do
    expect(checker.list_checkers).to_not be_empty
  end

  it 'check multiple documents correctly' do
    expect(checker.check_many([{type: :inn, content: "7743013901"}, {type: :bik, content: "123456?!@"}])).to eq [{type: :inn, content: "7743013901", correct: true, error: ""}, {type: :bik, content: "123456?!@", correct: false, error: ""}]
  end
end
