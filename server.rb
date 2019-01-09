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

#################### START HERE DURING CLINIC ####################

get '/floofs' do
  # Get all the floofs!

  erb :'/floofs/index'
end

get '/floofs/new' do
  erb :'floofs/new'
end

get '/floofs/:id' do
  # Let's hear it for the floof!

  # Grab all walkers, all days of the week, and all of this floof's
  # walks to appease the `floofs/show.erb` gods

  erb :'/floofs/show'
end

post '/walks' do
  # Grab my proposed floof, walker, and day from params

  # Make my walk!

  # If it is valid, redirect to the new floof's page; otherwise, stay on this one

end

#################### STOP HERE DURING CLINIC ####################

post '/floofs' do
  # Code here!
end

get '/walkers' do
  # Code here!
  erb :'/walkers/index'
end

get '/walkers/new' do
  erb :'/walkers/new'
end

get '/walkers/:walker_id' do
  # Code here!

  erb :'/walkers/show'
end

post '/walkers' do
  # Code here!
end
