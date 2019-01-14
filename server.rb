require 'sinatra'
require 'sinatra/activerecord'
require "pry" if development? || test?
require 'sinatra/flash'
require 'sinatra/reloader'
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
  @floof = Floof.find(params[:floof_id])
  walker = Walker.find(params[:walker_id])
  day = params[:day]

  walk = Walk.new(floof: @floof, walker: walker, day: day)

  # Uncomment the line below to test the fail path (because the form uses dropdowns with default values, it's impossible to create an invalid walk through the UI)
  # walk.day = nil

  if walk.save
    redirect to "/floofs/#{floof.id}"
  else
    @walks = @floof.walks
    @walkers = Walker.all
    @days = DAYS
    @error = walk.errors.full_messages.join("\n")
    erb :'floofs/show'
  end
end

#################### STOP HERE DURING CLINIC ####################

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
