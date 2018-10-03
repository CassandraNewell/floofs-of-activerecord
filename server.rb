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

############################ START HERE DURING CLINIC ############################

get '/floofs' do
  @floofs = Floof.all

  erb :'/floofs/index'
end

get '/floofs/new' do
  erb :'floofs/new'
end

get '/floofs/:id' do
  @floof = Floof.find(params[:id])
  @walks = @floof.walks

  @walkers = Walker.all
  @days = DAYS

  erb :'/floofs/show'
end

post '/walks' do
  ## Grab my proposed floof, walker, and day from params

  @floof = Floof.find(params[:floof_id])
  @walker = Walker.find(params[:walker_id])
  @day = params[:day]

  ## Make my walk!
  walk = Walk.new(floof: @floof, walker: @walker, day: @day)

  # If it is valid, redirect to the new floof's page; otherwise, stay on this one.

  if walk.save
    redirect "/floofs/#{params[:floof_id]}"
  else
    erb :'floofs/new'
  end
end

############################ STOP HERE DURING CLINIC ############################

post '/floofs' do
  floof = Floof.new(name: params[:name])
    if floof.save
      flash[:message] = "Saved!"
      redirect "/floofs"
    else
      flash[:error] = "Bummer, something went wrong."
      erb :'floofs/new'
    end
end

get '/walkers' do
  @walkers = Walker.all
  erb :'/walkers/index'
end

get '/walkers/new' do
  erb :'walkers/new'
end

get '/walkers/:walker_id' do
  @walker = Walker.find(params[:walker_id])
  @walks = @walker.walks
  @days = DAYS

  erb :'/walkers/show'
end

post '/walkers' do
  walker = Walker.new(name: params[:name])
    if walker.save
      flash[:message] = "Saved!"
      redirect '/walkers'
    else
      flash.now[:error] = "Bummer, something went wrong."
      erb :'walkers/new'
    end
end
