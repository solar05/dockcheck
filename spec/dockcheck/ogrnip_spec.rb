require 'spec_helper'

RSpec.describe DockCheck::Ogrnip do
  let(:checker) { DockCheck.new() }
  let(:valid_ogrnip) { {type: :ogrnip, content: "113774618581835"} }
  let(:invalid_ogrnip_1) { {type: :ogrnip, content: "123456789123456"} }
  let(:invalid_ogrnip_2) { {type: :ogrnip, content: "a123fv413123456"} }

  it "checks ogrnip correctly" do
    expect(checker.check(valid_ogrnip)).to eq({type: :ogrnip, content: "113774618581835", correct: true, error: ""})
    expect(checker.check(invalid_ogrnip_1)).to eq({type: :ogrnip, content: "123456789123456", correct: false, error: ""})
    expect(checker.check(invalid_ogrnip_2)).to eq({type: :ogrnip, content: "a123fv413123456", correct: false, error: ""})
  end

  it "throws when length invalid" do
    expect(checker.check({type: :ogrnip, content: "880"})).to eq({type: :ogrnip, content: "880", correct: false, error: 'Incorrect ogrnip numbers count!'})
  end
end
