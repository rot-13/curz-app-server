require 'sinatra'
require './handlers'

post '/play' do
  if params['file']
    handle_file(params['file'])
  elsif params['text']
    handle_text(params['text'])
  elsif params['soundmoji']
    handle_soundmoji(params['soundmoji'])
  end
  return "playing..."
end
