require 'spec_helper'

RSpec.describe DockCheck::Ogrn do
  let(:checker) { DockCheck.new() }
  let(:valid_ogrnip) { {type: :ogrn, content: "1137746185818"} }
  let(:invalid_ogrnip_1) { {type: :ogrn, content: "1234567891234"} }
  let(:invalid_ogrnip_2) { {type: :ogrn, content: "a123fv4131234"} }

  it "checks ogrn correctly" do
    expect(checker.check(valid_ogrnip)).to eq({:type=>:ogrn, :content=>"1137746185818", :error=>"", :correct=>true})
    expect(checker.check(invalid_ogrnip_1)).to eq({:type=>:ogrn, :content=>"1234567891234", :correct=>false, :error=>""})
    expect(checker.check(invalid_ogrnip_2)).to eq({:type=>:ogrn, :content=>"a123fv4131234", :correct=>false, :error=>""})
  end

  it "throws error when length invalid" do
    expect(checker.check({:type=>:ogrn, :content=>"880"})).to eq({:content=>"880", :correct=>false, :error=>"Incorrect ogrn numbers count!", :type=>:ogrn})
  end
end
