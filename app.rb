require 'sinatra'
require 'sinatra/reloader'
require './lib/movie'
require './lib/theatre'
require 'pry'
require 'pg'

DB = PG.connect({:dbname => 'theatrix'})
also_reload 'lib/**/*.rb'

get '/' do
    @page = 'Home'
    @css = 'home'
    erb :index
end

get '/theatres' do
    @oage = 'Theatres'
    @css = 'theatres'
    @theatres = Theatre.all
    erb :theatres
end

get '/theatres/new' do
    @oage = 'New Theatre'
    @css = 'New'
    erb :theatres_new
end
post '/theatres' do
    Theatre.new(params).save
    redirect to '/theatres'
end

get '/theatres/:id' do
    @theatre = Theatre.find(params[:id].to_i)
    erb :theatres_ID
end
