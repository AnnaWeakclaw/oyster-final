require './lib/journey'
describe Journey do
  let(:journey) {
    Journey.new("Barbican")
  }
  it 'has an entry_station' do
    expect(journey).to respond_to(:entry_station)
  end

  it 'knows the name of the entry station' do
    expect(journey.entry_station).to eq("Barbican")
  end

  it "knows the name of exit station" do
    journey.exit_station = "Bow"
    expect(journey.exit_station).to eq("Bow")
  end

end