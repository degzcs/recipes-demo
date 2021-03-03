require 'sinatra'

get '/' do
    @text = ''
    erb :list_view
end

get '/details' do
    @text = ''
    erb :details_view
end
