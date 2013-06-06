#!/usr/bin/env ruby

require 'open-uri'

open("http://www.hell-labs.de") do |file|
  file.each_line do |line|
    puts line
  end
end
