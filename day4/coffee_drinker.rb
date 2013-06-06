#!/usr/bin/env ruby

require './coffee_machine'

cm = CoffeeMachine.new
success = false

until success
  begin
    cm.make_coffee
    puts "Mache Kaffee"
    success = true
  rescue NoCoffeeException
    puts "Fuelle Kaffee ein"
    cm.refill_coffee(300)
  rescue NoWaterException
    puts "Fuelle Wasser ein"
    cm.refill_water(2000)
  end
end
