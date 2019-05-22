require 'journey'
require 'oystercard'
describe 'user makes journey from Barbican to Bow' do
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

end