require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkPage < Sinatra::Base
  get '/test' do
    'test'
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @all_bookmarks = Bookmark.new.all
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.new.create(url: params[:url])
    
    redirect '/bookmarks'
  end 

  get '/add_bookmark' do
    erb :add_bookmark
  end

  run if app_file == $0
end
