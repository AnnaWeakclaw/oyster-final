require "journeyLog"

describe JourneyLog do
  let(:log) { JourneyLog.new }
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey }
  let(:station) { double(:station)}

  it "initializes with empty list of journeys" do
    expect(log.history).to be_empty
  end
  it "initializes with a journey" do
    expect(log.journey).to be(Journey)
  end

  it "can store list of journeys" do
    log.store_journey(journey)
    expect(log.history.size).to eq(1)
  end

  it 'tells the journey to start' do 
    expect(journey).to receive(:set_entry_station)
    log.start(station)
  end

  it 'tells the journey to finish' do 
  end
end
