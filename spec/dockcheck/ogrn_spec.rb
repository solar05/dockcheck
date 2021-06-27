require 'spec_helper'

RSpec.describe DockCheck::Ogrn do
  let(:checker) { DockCheck.new(:ogrn) }
  let(:valid_ogrnip) { "1137746185818" }
  let(:invalid_ogrnip_1) { "1234567891234" }
  let(:invalid_ogrnip_2) { "a123fv4131234" }

  it "checks ogrn correctly" do
    expect(checker.check(valid_ogrnip, [])).to be true
    expect(checker.check(invalid_ogrnip_1, [])).to be false
    expect(checker.check(invalid_ogrnip_2, [])).to be false
  end

  it "throws exception when length invalid" do
    expect{ checker.check("880", []) }.to raise_error 'Incorrect ogrn numbers count!'
  end
end
