# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DockCheck::Ogrn do
  let(:checker) { DockCheck.new }
  let(:valid_ogrn) { { type: :ogrn, content: '1137746185818' } }
  let(:invalid_first_ogrn) { { type: :ogrn, content: '1234567891234' } }
  let(:invalid_second_ogrn) { { type: :ogrn, content: 'a123fv4131234' } }

  it 'checks ogrn correctly' do
    expect(checker.check(valid_ogrn)).to eq({ type: :ogrn, content: '1137746185818', error: '', correct: true })
    expect(checker.check(invalid_first_ogrn)).to eq({ type: :ogrn, content: '1234567891234', correct: false,
                                                      error: '' })
    expect(checker.check(invalid_second_ogrn)).to eq({ type: :ogrn, content: 'a123fv4131234', correct: false,
                                                       error: '' })
  end

  it 'throws error when length invalid' do
    expect(checker.check({ type: :ogrn,
                           content: '880' })).to eq({ content: '880', correct: false,
                                                      error: 'Incorrect ogrn numbers count!', type: :ogrn })
  end
end
