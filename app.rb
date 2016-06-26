require 'sinatra'
require 'sinatra/activerecord'
require 'byebug'
require './handlers'
require './app/models/clip'

set :database_file, 'config/database.yml'

post '/play' do
  if params['file']
    handle_file(params['file'])
    return "playing: #{params['file'][:filename]}"
  elsif params['url']
    handle_url(params['url'])
    return "playing: #{params['url']}"
  elsif params['text']
    handle_text(params['text'])
    return "playing \"#{params['text']}\""
  end
  return "How do I put this..?"
end

post '/save' do
  handle_save_url(params['title'], params['url'])
  return 'saved'
end
