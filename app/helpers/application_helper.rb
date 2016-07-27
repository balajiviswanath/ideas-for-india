module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end
  
   #taken from: http://stackoverflow.com/questions/5909121/converting-a-regular-youtube-link-into-an-embedded-video
    def youtube_embed(youtube_url,w,h)
      if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
      else
        # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
      end
    
      %Q{<iframe title="YouTube video player" width="#{w}" height="#{h}" src="https://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
    end
end
