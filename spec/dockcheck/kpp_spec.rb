require 'spec_helper'

RSpec.describe DockCheck::Kpp do
  let(:checker) { DockCheck.new(:kpp) }
  let(:valid_kpp_1) { "345807116" }
  let(:valid_kpp_2) { "1212BA222" }
  let(:invalid_kpp_1) { "123456?!@" }
  let(:invalid_kpp_2) { "a123fv413" }

  it "checks bik correctly" do
    expect(checker.check(valid_kpp_1, [])).to be true
    expect(checker.check(valid_kpp_2, [])).to be true
    expect(checker.check(invalid_kpp_1, [])).to be false
    expect(checker.check(invalid_kpp_2, [])).to be false
  end

  it "throws exception when length invalid" do
    expect{ checker.check("880", []) }.to raise_error 'Incorrect kpp numbers count!'
  end
end
