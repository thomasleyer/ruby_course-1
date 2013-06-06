#!/usr/bin/env ruby
require 'sinatra'

get '/' do
  'Willkommen'
end

get '/test' do
  if params[:name]
    @name = params[:name]
    "Hallo #{@name}"
  else
    "Hallo"
  end
end

get '/erb' do
  @name = params[:name]
  erb :simple
end
