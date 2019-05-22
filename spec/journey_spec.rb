require "./lib/journey"
describe Journey do
  let(:barbican_station) { double :barbican_station }
  let(:bow_station) { double :bow_station}
  let(:journey) {
    Journey.new(barbican_station)
  }
  it "has an entry_station" do
    expect(journey).to respond_to(:entry_station)
  end

  it "knows the name of the entry station" do
    expect(journey.entry_station).to eq(barbican_station)
  end

  it "knows the name of exit station" do
    journey.exit_station = bow_station
    expect(journey.exit_station).to eq(bow_station)
  end

  describe "knows how much the journey costs" do
    it "costs minimum fare for valid journey" do 
      journey.exit_station = bow_station
      expect(journey.fare).to eq(Journey::MINIMUM_FARE)
    end

    it "costs penalty fare for invalid journey" do 
      expect(journey.fare).to eq(Journey::PENALTY_FARE)
    end
  end
end
