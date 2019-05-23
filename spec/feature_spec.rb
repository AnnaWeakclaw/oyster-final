require 'journey'
require 'oystercard'

describe 'user makes journey from Barbican to Bow' do
  let(:barbican_station) { double :barbican_station }
  let(:bow_station) { double :bow_station}
  subject { Oystercard.new(90) }
  before(:each) do
    subject.touch_in('Barbican')
    subject.touch_out('Bow')
  end
  it '#history gives and instance of History class' do
    expect(subject.history.last).to be_an_instance_of(Journey)
  end
  it '#history.last gives the last journey exit station' do
    expect(subject.history.last.exit_station).to eq('Bow')
  end
  it '#history.last gives the last journey entry station' do
    expect(subject.history.last.entry_station).to eq('Barbican')
  end
  it "makes a valid journey and costs #{Journey::MINIMUM_FARE}" do
    subject.touch_in('Barbican')
    expect{subject.touch_out('Bow')}.to change{subject.balance}.by(-1)
  end
  describe 'valid and invalid journeys' do
    subject { Oystercard.new(90) }

    it "starts a journey, doens't finish, starts another journey, costs #{Journey::PENALTY_FARE}" do
      subject.touch_in(barbican_station)
      expect{subject.touch_in(bow_station)}.to change{subject.balance}.by(-Journey::PENALTY_FARE)
    end
    it "starts a journey, doens't finish, starts another journey, shows history" do

      subject.touch_in(barbican_station)
      subject.touch_in(barbican_station)
      binding.pry
      subject.touch_in(barbican_station)
      expect(subject.history).to eq(2)
    end

  end
end
