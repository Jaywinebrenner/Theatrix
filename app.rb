require 'sinatra'
require 'sinatra/reloader'
require './lib/movie'
require './lib/theatre'
require 'pry'
require 'pg'

DB = PG.connect({:dbname => 'theatrix'})
also_reload 'lib/**/*.rb'

get '/' do
end
