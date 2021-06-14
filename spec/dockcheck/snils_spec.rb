require 'spec_helper'

RSpec.describe DockCheck::Snils do
  let(:checker) { DockCheck.new(:snils) }
  let(:valid_snils) { "34380710664" }
  let(:invalid_snils) { "12345678901" }

  it "checks snils correctly" do
    expect(checker.check(valid_snils)).to be true
    expect(checker.check(invalid_snils)).to be false
  end

  it "throws exception when length invalid" do
    expect{ checker.check("8800555") }.to raise_error 'Incorrect snils numbers count!'
  end
end
