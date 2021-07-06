require 'spec_helper'

RSpec.describe DockCheck::Kpp do
  let(:checker) { DockCheck.new() }
  let(:valid_kpp_1) { {type: :kpp, content: "345807116"} }
  let(:valid_kpp_2) { {type: :kpp, content: "1212BA222"} }
  let(:invalid_kpp_1) { {type: :kpp, content: "123456?!@"} }
  let(:invalid_kpp_2) { {type: :kpp, content: "a123fv413"} }

  it "checks kpp correctly" do
    expect(checker.check(valid_kpp_1)).to eq({type: :kpp, content: "345807116", correct: true, error: ""})
    expect(checker.check(valid_kpp_2)).to eq({type: :kpp, content: "1212BA222", correct: true, error: ""})
    expect(checker.check(invalid_kpp_1)).to eq({type: :kpp, content: "123456?!@", correct: false, error: ""})
    expect(checker.check(invalid_kpp_2)).to eq({type: :kpp, content: "a123fv413", correct: false, error: ""})
  end

  it "throws error when length invalid" do
    expect(checker.check({type: :kpp, content: "880"})).to eq({type: :kpp, content: "880", correct: false, error: 'Incorrect kpp numbers count!'})
  end
end
