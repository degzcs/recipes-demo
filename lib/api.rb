require 'sinatra'
require_relative '../config/environment'
class Api < Sinatra::Base
  get '/about-me' do
    erb :about_me
  end

  get '/' do
    @recipes = Recipe.all
    erb :list_view
  end

  get '/recipes/:id' do
    id = params[:id]
    @recipe = Recipe.by_id(id)
    erb :details_view
  end
end
