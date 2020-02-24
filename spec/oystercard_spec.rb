require 'oystercard'
describe Oystercard do

  it "new card has a balance of zero" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it "will increase balance by amount of money passed" do
      expect(subject.top_up(10)).to eq 10
    end
    it "will limit top up amount to £90" do
      expect { subject.top_up(99) }.to raise_error "Card limit is £#{Oystercard::CARD_LIMIT}. This exceeds this limit"
    end
  end
  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }
    it "will decrease balance by amount of money passed" do
      #allow(subject.balance).to eq (50)
      subject.instance_variable_set(:@balance, 50)
      expect{subject.deduct(25)}.to change{ subject.balance }.by -25
    end
  end
  context '#in_journey' do
    it { is_expected.to respond_to :in_journey? }
    it { is_expected.to respond_to :touch_in }
    it { is_expected.to respond_to :touch_out }
    it 'touch_in to return in_journey as true' do
      expect(subject.touch_in).to eq true
    end
    it 'initial state to not be in_journey' do
      expect(subject).not_to be_in_journey
    end
    it 'can touch_in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it 'can touch_out' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
