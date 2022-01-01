# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DockCheck::Inn do
  let(:checker) { DockCheck.new }
  let(:ten_digit_valid_inn) { { type: :inn, content: '7743013901' } }
  let(:ten_digit_invalid_inn) { { type: :inn, content: '7743013902' } }
  let(:twelve_digit_valid_inn) { { type: :inn, content: '732897853530' } }
  let(:twelve_digit_invalid_inn) { { type: :inn, content: '732897853531' } }

  it 'checks inn correctly' do
    expect(checker.check(ten_digit_valid_inn)).to eq({ type: :inn, content: '7743013901', correct: true, error: '' })
    expect(checker.check(ten_digit_invalid_inn)).to eq({ type: :inn, content: '7743013902', correct: false, error: '' })

    expect(checker.check(twelve_digit_valid_inn)).to eq({ type: :inn, content: '732897853530', correct: true,
                                                          error: '' })
    expect(checker.check(twelve_digit_invalid_inn)).to eq({ type: :inn, content: '732897853531', correct: false,
                                                            error: '' })
  end

  it 'throws error when length invalid' do
    expect(checker.check({ type: :inn,
                           content: '8800555' })).to eq({ type: :inn, content: '8800555', correct: false,
                                                          error: 'Incorrect inn numbers count!' })
  end
end
