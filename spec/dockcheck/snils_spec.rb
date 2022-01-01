# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DockCheck::Snils do
  let(:checker) { DockCheck.new }
  let(:valid_snils) { { type: :snils, content: '34380710664' } }
  let(:invalid_snils) { { type: :snils, content: '12345678901' } }

  it 'checks snils correctly' do
    expect(checker.check(valid_snils)).to eq({ type: :snils, content: '34380710664', correct: true, error: '' })
    expect(checker.check(invalid_snils)).to eq({ type: :snils, content: '12345678901', correct: false, error: '' })
  end

  it 'throws error when length invalid' do
    expect(checker.check({ type: :snils,
                           content: '8800555' })).to eq({ type: :snils, content: '8800555',
                                                          error: 'Incorrect snils numbers count!',
                                                          correct: false })
  end
end
