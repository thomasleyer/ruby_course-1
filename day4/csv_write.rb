#!/usr/bin/env ruby

require "csv"

CSV.open("test_write.csv", "w") do |csv|
  csv << ["Chris", "Neue Str. 4", "Aschersleben"]
  csv << ["Katja", "Neue Str. 4", "Aschersleben"]
  csv << ["Albert", "Neue Str. 4", "Aschersleben"]
end


