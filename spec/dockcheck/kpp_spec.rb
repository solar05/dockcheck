# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DockCheck::Kpp do
  let(:checker) { DockCheck.new }
  let(:valid_first_kpp) { { type: :kpp, content: '345807116' } }
  let(:valid_second_kpp) { { type: :kpp, content: '1212BA222' } }
  let(:invalid_first_kpp) { { type: :kpp, content: '123456?!@' } }
  let(:invalid_second_kpp) { { type: :kpp, content: 'a123fv413' } }

  it 'checks kpp correctly' do
    expect(checker.check(valid_first_kpp)).to eq({ type: :kpp, content: '345807116', correct: true, error: '' })
    expect(checker.check(valid_second_kpp)).to eq({ type: :kpp, content: '1212BA222', correct: true, error: '' })
    expect(checker.check(invalid_first_kpp)).to eq({ type: :kpp, content: '123456?!@', correct: false, error: '' })
    expect(checker.check(invalid_second_kpp)).to eq({ type: :kpp, content: 'a123fv413', correct: false, error: '' })
  end

  it 'throws error when length invalid' do
    expect(checker.check({ type: :kpp,
                           content: '880' })).to eq({ type: :kpp, content: '880', correct: false,
                                                      error: 'Incorrect kpp numbers count!' })
  end
end
