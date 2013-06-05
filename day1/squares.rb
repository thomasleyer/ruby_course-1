#!/usr/bin/env ruby 

# Programm bekommt per Kommandozeile eine Zahl uebergeben und 
# gibt das Quadrat dieser Zahl zurueck.

def squares(input_number)
  return input_number * input_number
end

input = ARGV[0].to_i
puts "When called with #{input}, squares returns #{squares(input)}."
