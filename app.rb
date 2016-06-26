require 'sinatra'
require './handlers'

post '/play' do
  if params['file']
    handle_file(params['file'])
    return "playing: #{params['file'][:filename]}"
  elsif params['text']
    handle_text(params['text'])
    return "playing \"#{params['text']}\""
  end
  return "How do I put this..?"
end
