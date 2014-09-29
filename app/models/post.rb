class Post < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  belongs_to :user

  before_create :grab_youtube_id
  before_create :grab_soundcloud_id

  def grab_youtube_id 
    self.youtube = youtube[/(?<=[?&]v=)[^&$]+/] if youtube
  end

  # Move to sidekiq
  def grab_soundcloud_id
    if soundcloud
      client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'])
      begin
        track = client.get('/resolve', url: soundcloud)
        self.soundcloud = track.id
      rescue Soundcloud::ResponseError => e
        'You do not have access to this track'
      end
    end
  end

end
