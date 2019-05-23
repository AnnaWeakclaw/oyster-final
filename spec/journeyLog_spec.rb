require "journeyLog"

describe JourneyLog do
  let(:log) { JourneyLog.new }
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey }

  it "initializes with empty list of journeys" do
    expect(log.history).to be_empty
  end
  it "initializes with a journey" do
    expect(log.journey).to be(Journey)
  end

  it "can store list of journeys" do
    log.store_journey
    expect(log.history.size).to eq(1)
  end
end
