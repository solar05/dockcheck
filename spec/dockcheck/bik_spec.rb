# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DockCheck::Bik do
  let(:checker) { DockCheck.new }
  let(:valid_bik) { { type: :bik, content: '343807106' } }
  let(:invalid_first_bik) { { type: :bik, content: '123456?!@' } }
  let(:invalid_second_bik) { { type: :bik, content: 'a123fv413' } }

  it 'checks bik correctly' do
    expect(checker.check(valid_bik)).to eq({ type: :bik, content: '343807106', correct: true, error: '' })
    expect(checker.check(invalid_first_bik)).to eq({ type: :bik, content: '123456?!@', error: '', correct: false })
    expect(checker.check(invalid_second_bik)).to eq({ type: :bik, content: 'a123fv413', error: '', correct: false })
  end

  it 'throws error when length invalid' do
    expect(checker.check({ type: :bik,
                           content: 'a123' })).to eq({ type: :bik, content: 'a123', correct: false,
                                                       error: 'Incorrect bik numbers count!' })
  end
end
