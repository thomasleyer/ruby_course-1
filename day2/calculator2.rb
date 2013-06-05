#! /usr/bin/env ruby

# Ein kleiner Taschenrechner.
# Der Benutzer gibt eine Rechnenoperation im Format <operant1> <operator> <operant2> ein.
# Das Programm prueft die Eingabe und fuehrt bei korrekter Eingabe die Berechnung durch und gibt ein Ergebnis aus.
# Bei fehlerhafter Eingabe soll eine Fehlermeldung ausgegeben und das Programm beendet werden.

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

puts "Bitte geben Sie eine Rechenoperation ein:"

input = gets.chop

regex = /\A([\-\+]?\d{1,}\.?\d{1,}?) ([\+\-\*\/]) ([\-\+]?\d{1,}\.?\d{1,}?)\Z/

match_data = regex.match(input)

if(match_data == nil)
  puts "Fehleingabe"
else
  printf("%.2f\n", calculate(match_data[1].to_f, match_data[3].to_f, match_data[2]))
end
