require 'oystercard'
require 'journey'

describe Oystercard do


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
    expect(subject.journey).to be false
  end

  it 'prevents journey if balance too low' do
    expect{ subject.touch_in ("Bar")}.to raise_error "not enough funds"
  end

  it 'charges a minimum fare' do
    subject.top_up(10)
    subject.touch_in("Bar")
    expect{ subject.touch_out("Bow") }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
  end

  it "remembers entry station" do
    subject.top_up(5)
    subject.touch_in("Barbican")
    expect(subject.entry_station).to eq("Barbican")
  end

  it "starts journey on touch in" do
    subject.top_up(5)
    expect(subject.touch_in("Bar")).to be_an_instance_of(Journey)
  end

  it "wipes out entry station on touch out" do
    subject.top_up(5)
    subject.touch_in("Barbican")
    subject.touch_out("Bow")
    expect(subject.entry_station).to eq(nil)
  end
  let(:journey) {double(:journey)}
  let(:journey_class) { double(:journey_class, new: journey)}
  it "sets exit station on touch out" do
    card = Oystercard.new(80, journey_class)
    card.top_up(5)
    card.touch_in("Barbican")
    expect(journey).to receive(:exit_station=)
    card.touch_out("Bow")
    
  end
  it "can store list of journeys" do
    subject.top_up(10)
    3.times { 
      subject.touch_in("Barbican")
      subject.touch_out("Bow") }

      expect(subject.history.size).to eq(3)
  end


end
