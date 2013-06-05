#! /usr/bin/env ruby

# Aufgabenstellung siehe Folie 96, Adressdatenbank
# WARNING - DOES NOT WORK

DATAFILE = "addresses.db"

def load(filename)
  puts "Called"
  file = File.open(filename)
  file.each { |line| puts line }
end

input = ""
address_sets = []

if(File.exists? DATAFILE)
  puts "Loading previous records"
  load(DATAFILE)
end

until input == "Q"
  puts "\nN fuer neuen Datensatz\nL, um alle Datensaetze anzuzeigen\neinen Index, um einen bestimmten Datensatz anzuzeigen\nQ zum Beenden\nIhre Eingabe:\n\n"

input = gets.chop.upcase

case input
  when "N"
    print "Name: "
    name = gets.chop
    print "Strasse: "
    street = gets.chop
    print "Ort: "
    city = gets.chop

    address = {:name => name, :street => street, :city => city}
    address_sets << address
    File.open(DATAFILE, "a") {|f| f.write(address.values.to_s + "\n" )}

  when "L"
    address_sets.each_with_index { |element, index| puts "#{index+1}: #{element[:name]}" }
  when "Q"
    puts "Auf Wiedersehen"
  else
    if(input.to_i.class == Fixnum)
      index = input.to_i - 1
      if(address_sets[index] && index >= 0)
        puts address_sets[index]
      else
        puts "Ein Datensatz mit diesem Index ist nicht vorhanden!"
      end
    else
      puts "Es ist ein Fehler aufgetreten.\nBitte pruefen Sie ihre Eingabe."
    end
  end
end
