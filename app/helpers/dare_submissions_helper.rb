require 'cgi'

module DareSubmissionsHelper
  
  def embed(youtube_url)
    params = CGI::parse(URI::parse(youtube_url).query)
    youtube_id = params["v"].first
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end
