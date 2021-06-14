require 'spec_helper'

RSpec.describe DockCheck::Inn do
  let(:checker) { DockCheck.new(:inn) }
  let(:ten_digit_valid_inn) { "7743013901" }
  let(:ten_digit_invalid_inn) { "7743013902" }
  let(:twelve_digit_valid_inn) { "732897853530" }
  let(:twelve_digit_invalid_inn) { "732897853531" }

  it "checks inn correctly" do
    expect(checker.check(ten_digit_valid_inn)).to be true
    expect(checker.check(ten_digit_invalid_inn)).to be false

    expect(checker.check(twelve_digit_valid_inn)).to be true
    expect(checker.check(twelve_digit_invalid_inn)).to be false
  end

  it "throws exception when length invalid" do
    expect{ checker.check("8800555") }.to raise_error 'Incorrect inn numbers count!'
  end
end
