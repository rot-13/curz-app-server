require 'net/http'

STREAM_FILE_URI = URI('https://cpc-curz.herokuapp.com/play_file')
STREAM_URL_URI  = URI('https://cpc-curz.herokuapp.com/play_url')
STREAM_TEXT_URI = URI('https://cpc-curz.herokuapp.com/play_text')

def handle_file(file_object)
  Net::HTTP.post_form(STREAM_FILE_URI, 'file' => file_object[:tempfile])
end

def handle_url(url)
  Net::HTTP.post_form(STREAM_URL_URI, 'url' => url)
end

def handle_text(text)
  clips = Clip.where(title: text)
  if clips.present?
    Net::HTTP.post_form(STREAM_URL_URI, 'url' => clips.first.url)
  end
  Net::HTTP.post_form(STREAM_TEXT_URI, 'text' => text)
end

def handle_save_url(title, url)
  Clip.create!(title: title, url: url)
end
