require 'sinatra'
require 'sinatra/activerecord'
require './handlers'
require './app/models/clip'

set :database_file, 'config/database.yml'

post '/play' do
  if params['file']
    handle_file(params['file'])
    return "playing: #{params['file']['filename']}"
  elsif params['text']
    handle_text(params['text'])
    return "playing \"#{params['text']}\""
  end
  return "How do I put this..?"
end
