# frozen_string_literal: true
# require 'sinatra/flash'
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :session
  get '/' do
    'Hello Bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'/bookmarks/new'
  end

  post '/bookmarks/new' do
    Bookmark.add(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
