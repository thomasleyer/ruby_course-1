#! /usr/bin/env ruby

# Ein kleiner Taschenrechner.
# Der Benutzer gibt nacheinander eine Zahl, einen Operator und eine zweite Zahl ein.
# Das Programm fuehrt die Berechnung durch und gibt ein Ergebnis aus.

def calculate(operand1, operand2, operator)
  case operator
  when "+"
    operand1 + operand2
  when "-"
    operand1 - operand2
  when "*"
    operand1 * operand2
  when "/"
    if(operand2 == 0)
      puts "Eine Division durch 0 ist nicht sinnvoll."
      exit
    else
      operand1 / operand2
    end
  else
    puts "Es ist ein Fehler aufgetreten.\nBitte pruefen Sie ihre Eingabe."
    exit
  end
end

puts "Bitte geben Sie eine Zahl ein: "
operand1 = gets.to_f

puts "Bitte geben Sie den Operator ein: "
operator = gets.chop

puts "Bitte geben Sie die zweite Zahl ein: "
operand2 = gets.to_f

puts calculate(operand1, operand2, operator)
