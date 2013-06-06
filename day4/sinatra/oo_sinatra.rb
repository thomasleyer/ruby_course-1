require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    "Welcome"
  end
end

MyApp.run!
