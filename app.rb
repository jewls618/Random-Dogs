require 'sinatra'
require 'pry'
require 'httparty'

get '/' do
  redirect '/doggiphy'
end

get '/doggiphy' do

  response = HTTParty.get('http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=dog')

  image_url = response["data"]
  image_original_url = image_url["image_original_url"]

  erb :index, locals: { image_original_url: image_original_url }
end
