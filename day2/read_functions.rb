def write_address(addresses)
  File.open(DATAFILE, "w") do |file|
    addresses.each do |address|
      file.puts "Name: #{address[:name]}, Street: #{address[:street]}, City: #{address[:city]}"
    end
  end
end

def read_addresses
  list = []
  File.open(DATAFILE, "r") do |file|
    content = file.read
    content.scan(/^Name: (.*), Street: (.*), City: (.*)$/) do |match|
      list << {name: match[0], steet: match[1], city: match[2]}
    end
  end
  return list
end
