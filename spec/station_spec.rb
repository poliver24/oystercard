require "station"

describe Station do

  subject { described_class.new(name: "Station name", zone: 1) }

  it "checks the name" do
    expect(subject.name).to eq("Station name")
  end

  it "checks the zone" do
    expect(subject.zone).to eq(1)
  end


end
