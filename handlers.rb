require 'net/http'

STREAM_FILE_URI = URI('https://cpc-curz.herokuapp.com/play_file')
STREAM_TEXT_URI = URI('https://cpc-curz.herokuapp.com/play_text')

def handle_file(file_object)
  Net::HTTP.post_form(STREAM_FILE_URI, 'file' => file_object)
end

def handle_text(text)
  Net::HTTP.post_form(STREAM_TEXT_URI, 'text' => text)
end
