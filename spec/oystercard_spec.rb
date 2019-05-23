require 'oystercard'
require 'journey'
# require 'pry-byebug'

describe Oystercard do
  let(:valid_journey_dbl) {double(:journey, fare: 1, status: :complete, set_entry_station: nil)}
  let(:valid_journey_class) { double(:journey_class, new: valid_journey_dbl)}
  let(:log_class) { double(:log_class, :new => log)}
  let(:log) { double(:journey_log)}

  it 'has a default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it 'has a limit of £90' do
    subject.top_up(90)
    expect{ subject.top_up(10) }.to raise_error "limit is £#{Oystercard::LIMIT}"
  end

  it 'can pay for travel' do
    card = Oystercard.new(50)
    card.touch_in("Station")
    card.touch_out("Bow")
    expect(card.balance).to eq(49)
  end

  it 'can start a journey' do
    subject.top_up(4)
    subject.touch_in("Bar")
    expect(subject.journey?).to be true
  end

  it 'can end a journey' do
    subject.top_up(10)
    subject.touch_in("Station")
    subject.touch_out("Bow")
    expect(subject.journey?).to be false
  end

  it 'prevents journey if balance too low' do
    expect{ subject.touch_in ("Bar")}.to raise_error "not enough funds"
  end

  it 'charges a minimum fare' do
    subject.top_up(10)
    subject.touch_in("Bar")
    expect{ subject.touch_out("Bow") }.to change{ subject.balance }.by(-Journey::MINIMUM_FARE)
  end
  

  it "sets exit station on touch out" do
    card = Oystercard.new(80, valid_journey_class)
    card.top_up(5)
    card.touch_in("Barbican")
    expect(valid_journey_dbl).to receive(:exit_station=)
    card.touch_out("Bow")
    
  end

  it 'can tell the journey log to store a journey' do
    expect(log).to receive(:store_journey)
    subject.complete_journey
  end 


end
