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
  ## Where my floofs at?
  erb :'/floofs/index'
end

get '/floofs/new' do
  erb :'floofs/new'
end

get '/floofs/:id' do
  ## Let's hear it for the floof!

  ## Grab all the walkers, all the days of the week, and all of this floof's
  ## walks too, to appease the `floofs/show.erb` gods

  erb :'/floofs/show'
end

post '/walks' do
  ## Grab my proposed floof, walker, and day from params

  ## Make my walk!

  # If it is valid, redirect to the new floof's page; otherwise, stay on this one.

  erb :'floofs/new'
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
