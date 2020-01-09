require 'sinatra'
require 'sinatra/reloader'
require './lib/movie'
require './lib/theatre'
require 'pry'
require 'pg'

DB = PG.connect({:dbname => 'theatrix'})
also_reload 'lib/**/*.rb'

def get_class(type)
    return Movie if (type == 'movies')
    return Theatre if (type == 'theatres')
    nil
end

get '/' do
    @page = 'Home'
    @css = 'home'
    erb :index
end

get '/:type' do
    redirect to '/error' unless (['theatres', 'movies'].include? params[:type])
    type = get_class(params[:type])

    @page = params[:type]
    @css = 'list'
    @items = type.all
    erb :items
end

get '/:type/new' do
    redirect to '/error' unless (['theatres', 'movies'].include? params[:type])
    type = get_class(params[:type])

    @page = "New #{params[:type].capitalize}"
    @css = 'new'
    erb :items_new
end
post '/:type' do
    type = get_class(params[:type])

    type.new(params).save
    redirect to "/#{params[:type]}"
end

get '/:type/:id' do
    redirect to '/error' unless (['theatres', 'movies'].include? params[:type])
    type = get_class(params[:type])

    @item = type.find(params[:id].to_i)
    @page = @item.name
    @css = 'item_ID'
    erb :items_ID
end

get '/:type/:id/edit' do
    redirect to '/error' unless (['theatres', 'movies'].include? params[:type])
    type = get_class(params[:type])

    @item = type.find(params[:id].to_i)
    @page = "Editing #{@item.name}"
    @css = 'item_ID_edit'
    erb :item_ID_edit
end
patch '/:type/:id' do
    type = get_class(params[:type])
    item = type.find(params[:id].to_i).update(params)
    unless (params[:movie_name].empty? || params[:showtime].empty?)
        item.add_showing(params[:movie_name], params[:showtime])
    end
    redirect to "/#{params[:type]}/#{params[:id]}"
end
delete '/:type/:id' do
    type = get_class(params[:type])
    type.find(params[:id].to_i).delete
    redirect to "/#{params[:type]}"
end
