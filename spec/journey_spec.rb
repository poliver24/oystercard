require 'journey'
describe Journey do

  describe "#in_journey?" do

    it "initially set the card's status to not in journey" do
      # card = OysterCard.new
      expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do

    let(:station){ double(:station)}

    it { is_expected.to respond_to(:touch_in).with(1).argument }

    it "can touch in" do
      subject.touch_in(station)

    end

    it "remembers touch_in station " do
      subject.touch_in(station)
      expect(subject.entry_station).to eq(station)

    end

  end

  describe "#touch_out" do

    before(:each) do
      subject.touch_in(entry_station)
    end

    let(:entry_station){ double(:entry_station) }
    let(:exit_station){ double(:exit_station) }

    it { is_expected.to respond_to(:touch_out).with(1).argument }


    it "stores exit station" do
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end

    it "creates a journey from entry_station to exit_station and stores it as hash" do
      subject.touch_out(exit_station)
      expect(subject.complete_journey).to include { {entry_station => exit_station} }
    end
  end

  describe 'fare' do

    it 'returns penalty fare if no entry_station' do
      subject.touch_out('work')
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns penalty fare if no exit_station' do
      subject.touch_in('home')
      subject.touch_in('home')
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    # it 'calculates fare for journey' do
    #
    # end

  end
end
