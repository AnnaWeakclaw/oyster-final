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

  it "can store journey history" do
    expect(journey.history).to be_empty
  end


end