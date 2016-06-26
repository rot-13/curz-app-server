require 'net/http'

STREAM_URL = URI('https://cpc-curz.herokuapp.com')

def handle_file(file_object)
  Net::HTTP.post_form(STREAM_URL, file: file_object['tempfile'])
end

def handle_text(text)
end

def handle_soundmoji(name)
end
