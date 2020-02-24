require 'oystercard'
describe Oystercard do

  it "new card has a balance of zero" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it "will increase balance by amount of money passed" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
    it "will limit top up amount to £90" do
      expect { subject.top_up(99) }.to raise_error "Card limit is £#{Oystercard::CARD_LIMIT}. This exceeds this limit"
    end

  end

end
