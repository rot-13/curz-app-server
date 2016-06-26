require 'net/http'
require 'espeak'

include ESpeak

STREAM_URI = URI('https://cpc-curz.herokuapp.com/play_file')

def handle_file(file_object)
  Net::HTTP.post_form(STREAM_URI, 'file' => file_object)
end

def handle_text(text)
  file_path = './public/text-#{Time.now.getutc}.mp3'
  speech = Speech.new(text)
  speech.save(file_path)
  File.open(file_path, 'r') do |file|
    Net::HTTP.post_form(STREAM_URI, 'file' => file)
  end
end
