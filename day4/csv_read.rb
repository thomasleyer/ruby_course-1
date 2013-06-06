#!/usr/bin/env ruby

require "csv"

CSV.foreach("test.csv") do |row|
  p row
end


