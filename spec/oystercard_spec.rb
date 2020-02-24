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

  end

end
