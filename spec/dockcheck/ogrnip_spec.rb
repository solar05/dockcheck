require 'spec_helper'

RSpec.describe DockCheck::Ogrnip do
  let(:checker) { DockCheck.new(:ogrnip) }
  let(:valid_ogrnip) { "113774618581835" }
  let(:invalid_ogrnip_1) { "123456789123456" }
  let(:invalid_ogrnip_2) { "a123fv413123456" }

  it "checks ogrnip correctly" do
    expect(checker.check(valid_ogrnip, [])).to be true
    expect(checker.check(invalid_ogrnip_1, [])).to be false
    expect(checker.check(invalid_ogrnip_2, [])).to be false
  end

  it "throws exception when length invalid" do
    expect{ checker.check("880", []) }.to raise_error 'Incorrect ogrnip numbers count!'
  end
end
