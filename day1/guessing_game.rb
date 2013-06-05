#! /usr/bin/env ruby

# Ein Ratespiel, bei dem der User eine Zufallszahl erraten soll. 
# Bei jedem Durchlauf wird angezeigt, wie oft bisher geraten wurde.
# Anschliessend gibt der User einen Tipp ab. Das Programm gibt aus, 
# ob der Tipp korrekt war oder ob die angegebene Zahl kleiner oder groesser als 
# die Zufallszahl war.
# Im Falle eines korrekten Versuchs beendet sich das Programm. 

number_to_guess = (rand 100) + 1
tries = 0
success = false

until success 
  puts "Bitte geben Sie eine Zahl ein: "
  guess = gets.chop.to_i
  tries += 1
  puts "Es ist ihr #{tries}. Versuch."
  if guess == number_to_guess
    puts "Richtig. Sie brauchten #{tries} Versuche."
    success = true 
  elsif guess > number_to_guess
    puts "Ihre Zahl ist groesser als die Zufallszahl"
  elsif guess < number_to_guess
    puts "Ihre Zahl ist kleiner als die Zufallszahl"
  else
    # We shouldn't have come here.
    puts "What?!"
    exit
  end
end
