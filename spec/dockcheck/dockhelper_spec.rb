require 'spec_helper'

RSpec.describe DockCheck::Snils do

  it "numberize documents correctly" do
    expect(DockHelper.numberize_document("123")).to eq [1, 2, 3]
  end

  it "checks only digits in documents correctly" do
    expect(DockHelper.only_digits?("123")).to be true
    expect(DockHelper.only_digits?("123!@")).to be false
    expect(DockHelper.only_digits?("asdsa")).to be false
  end

end
