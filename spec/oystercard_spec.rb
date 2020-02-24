require "oystercard"

describe Oystercard do

  it "initializes with default balance of 0" do
    expect(subject.balance).to eq 0
  end
end

describe "#top_up" do

  it "adds #top_up value to balance" do
    card = Oystercard.new
    subject.top_up(10)
    expect(subject.balance).to eq 10
    # expect { subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it "raises an error when #top_up value exceeds limit" do
    card = Oystercard.new
    expect{ subject.top_up(95) }.to raise_error("Top up limit of #{Oystercard::LIMIT} exceeded")
  end
end
