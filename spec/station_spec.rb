require "station"

describe Station do
  subject { Station.new("Bow", 2) }
  it "has a name" do
    expect(subject.name).to eq("Bow")
  end
  it "has a zone" do
    expect(subject.zone).to eq(2)
  end
end
