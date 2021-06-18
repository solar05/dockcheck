require 'spec_helper'

RSpec.describe DockCheck::Snils do
  let(:checker) { DockCheck.new(:bik) }
  let(:valid_bik) { "343807106" }
  let(:invalid_bik_1) { "123456?!@" }
  let(:invalid_bik_2) { "a123fv413" }

  it "checks bik correctly" do
    expect(checker.check(valid_bik, [])).to be true
    expect(checker.check(invalid_bik_1, [])).to be false
    expect(checker.check(invalid_bik_2, [])).to be false
  end

  it "throws exception when length invalid" do
    expect{ checker.check("880", []) }.to raise_error 'Incorrect bik numbers count!'
  end
end
