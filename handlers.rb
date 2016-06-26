require 'net/http'
require 'net/http/post/multipart'

STREAM_FILE_URI = URI('https://cpc-curz.herokuapp.com/play_file')
STREAM_URL_URI  = URI('https://cpc-curz.herokuapp.com/play_url')
STREAM_TEXT_URI = URI('https://cpc-curz.herokuapp.com/play_text')

def handle_file(file_object)
  file = file_object[:tempfile]
  ext = file_object[:filename].split('.').last
  req = Net::HTTP::Post::Multipart.new(STREAM_FILE_URI.path, 'file' => UploadIO.new(file, "audio/#{ext}"))
  http = Net::HTTP.new(STREAM_FILE_URI.host, STREAM_FILE_URI.port)
  http.use_ssl = true
  http.request(req)
end

def handle_url(url)
  Net::HTTP.post_form(STREAM_URL_URI, 'url' => url)
end

def handle_text(text)
  clips = Clip.where(title: text)
  if clips.present?
    Net::HTTP.post_form(STREAM_URL_URI, 'url' => clips.first.url)
  else
    Net::HTTP.post_form(STREAM_TEXT_URI, 'text' => text)
  end
end

def handle_save_url(title, url)
  if title.blank?
    return
  end

  unless Clip.find_by(title: title)
    Clip.create!(title: title, url: url)
  end
end
