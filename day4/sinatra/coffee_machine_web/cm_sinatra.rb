require "sinatra/base"
require "./coffee_machine"

class WebCoffeeMachine < Sinatra::Base

  set :cm, CoffeeMachine.new

  get '/' do
    erb :layout
  end
end

#settings parameter

WebCoffeeMachine.run!
