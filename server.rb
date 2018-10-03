require 'sinatra'
require 'sinatra/activerecord'
require "pry" if development? || test?
require 'sinatra/flash'
set :sessions, true


Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
end

configure do
  set :views, 'app/views'
end

DAYS = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

get '/' do
  redirect '/floofs'
end

get '/floofs' do
  # Code here!
  erb :'/floofs/index'
end

get '/floofs/new' do
  erb :'floofs/new'
end

get '/floofs/:id' do
  # Code here!

  erb :'/floofs/show'
end

post '/walks' do
  # Code here!
end

post '/floofs' do
  # Code here!
end

get '/walkers' do
  # Code here!
  erb :'/walkers/index'
end

get '/walkers/new' do
  erb :'walkers/new'
end

get '/walkers/:walker_id' do
  # Code here!

  erb :'/walkers/show'
end

post '/walkers' do
  # Code here!
end
