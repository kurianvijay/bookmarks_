require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb(:bookmark_form)
    redirect('/')
  end

  post '/' do
    erb(:success)
  end

  run! if app_file == $0
end
