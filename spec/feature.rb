require './lib/oystercard'
require './lib/journey'
require 'pry-byebug'

card = Oystercard.new


station1 = "Bar"
 card.top_up(10)
 card.touch_in(station1)  #Bar
  journey = Journey.new(station1)
 journey.entry_station # Barbican

 card.touch_out("Up")
 card.touch_in("Bow")

 card.touch_out("Rome")

