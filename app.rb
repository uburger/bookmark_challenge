require 'sinatra/base'

class Bookmark_page < Sinatra::Base

  get '/test' do
    "test"
  end

  get '/bookmarks' do
    "bookmark 1"
  end

  run if app_file == $0
end
