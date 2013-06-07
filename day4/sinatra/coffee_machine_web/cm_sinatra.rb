require "sinatra/base"
require "./coffee_machine"

class WebCoffeeMachine < Sinatra::Base

  set :cm, CoffeeMachine.new

  get '/' do
   @info = settings.cm.info
   erb :info
  end

  get '/fill' do
    settings.cm.refill_water(1000)
    settings.cm.refill_coffee(100)
    @info = "filled"
    erb :info
  end

  get '/clean' do
    @info = settings.cm.clean
    erb :info
  end
  
  post '/refill_coffee' do
    amount = params['coffee_input'].to_i
    begin
      @info = settings.cm.refill_coffee(amount)
    rescue ToMuchCoffeeException
     @info = "Zuviel Kaffee eingefuellt, bitte Fuellmenge reduzieren."
    end
    erb :info
  end

  post '/refill_water' do
    amount = params['water_input'].to_i
    begin
     @info = settings.cm.refill_water(amount)
    rescue ToMuchWaterException
      @info ="Zuviel Wasser eingefuellt, bitte Fuellmenge reduzieren." 
    end
    erb :info
  end

  get '/make' do
    begin
      @info = settings.cm.make_coffee
    rescue NoCoffeeException
     @info = "Bitte Kaffee auffuellen."
    rescue NoWaterException
     @info = "Bitte Wasser auffuellen."
    end
    erb :info
  end
end

WebCoffeeMachine.run!
