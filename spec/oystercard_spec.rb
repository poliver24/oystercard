require "oystercard"

describe Oystercard do

it "initializes with default balance of 0" do
  expect(subject.balance).to eq 0
end

describe "#top_up" do

  it "adds #top_up value to balance" do
    card = Oystercard.new
    subject.top_up(10)
    expect(subject.balance).to eq 10
    # expect { subject.top_up 1 }.to change{ subject.balance }.by 1
  end
end

end
