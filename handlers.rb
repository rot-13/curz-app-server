require 'net/http'
require 'net/http/post/multipart'
require 'espeak'

include ESpeak

STREAM_FILE_URI = URI('https://cpc-curz.herokuapp.com/play_file')
STREAM_URL_URI  = URI('https://cpc-curz.herokuapp.com/play_url')

def handle_file(file_object)
  file = file_object[:tempfile]
  mime_type = FileMagic.new(FileMagic::MAGIC_MIME).file(file)
  req = Net::HTTP::Post::Multipart.new(STREAM_FILE_URI.path, 'file' => UploadIO.new(file, 'audio/mp3'))
  http.request(req)
end

def handle_url(url)
  Net::HTTP.post_form(STREAM_URL_URI, 'url' => url)
end

def handle_text(text)
  file_path = File.join(File.dirname(__FILE__), 'public', "text-#{Time.now.getutc}.mp3")
  speech = Speech.new(text)
  speech.save(file_path)
  File.open(file_path, 'r') do |file|
    req = Net::HTTP::Post::Multipart.new(STREAM_FILE_URI.path, 'file' => UploadIO.new(file, 'audio/mp3'))
    http.request(req)
  end
end
