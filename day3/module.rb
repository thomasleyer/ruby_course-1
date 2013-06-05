module MyTest
  def self.included(klass)
    puts "Inkludiert in #{klass}"
  end
  
  def self.extended(klass)
    puts "Module erweitert #{klass}"
  end
end

class User
  include MyTest
end

class SystemUser
  extend MyTest
end
