require "sinatra/base"
require "./coffee_machine"

class WebCoffeeMachine < Sinatra::Base

  set :cm, CoffeeMachine.new

  get '/' do
    erb :layout
  end

  get '/info' do
    settings.cm.info
  end

  get '/fill' do
    settings.cm.refill_water(1000)
    settings.cm.refill_coffee(100)
    "filled"
  end
  
  get '/refill_coffee/:id' do
    amount = params[:id]
    begin
      settings.cm.refill_coffee(amount.to_i)
    rescue ToMuchCoffeeException
      "Zuviel Kaffee eingefuellt, bitte Fuellmenge reduzieren."
    end
  end

  get '/refill_water/:id' do
    amount = params[:id]
    begin
      settings.cm.refill_water(amount.to_i)
    rescue ToMuchWaterException
      "Zuviel Wasser eingefuellt, bitte Fuellmenge reduzieren." 
    end
  end

  get '/make' do
    begin
      settings.cm.make_coffee
    rescue NoCoffeeException
      "Bitte Kaffee auffuellen."
    rescue NoWaterException
      "Bitte Wasser auffuellen."
    end
  end
end

#settings parameter

WebCoffeeMachine.run!
