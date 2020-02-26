require "oystercard"

describe OysterCard do

  it "initializes with default balance of 0" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }
    # it "checks if #top_up value has been given" do
    #   expect(subject).to respond_to(:top_up).with(1).argument
    # end

    it "adds #top_up value to balance" do
      #card = OysterCard.new
      expect { subject.top_up 10 }.to change{ subject.balance }.by 10

      # subject.top_up(10)
      # expect(subject.balance).to eq 10
    end

    it "raises an error if the maximum balance is exceeded" do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error("Maximum balance of #{OysterCard::MAXIMUM_BALANCE} exceeded")
    end
  end

  describe "#deduct" do

    it "#deducts value from balance" do
      # card = OysterCard.new
      expect { subject.deduct 5 }.to change{ subject.balance }.by -5
    end
  end

  describe "#touch_in" do

    it "checks if card has been used to #touch_in" do
      # card = OysterCard.new
      expect(subject.touch_in).to eq true
    end
  end
end
