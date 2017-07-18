class TwitterSync
  def self.update
    options = { count: 20 }
    if most_recent_tweet = TwitterStatus.order(timestamp: :desc).limit(1).first
      options[:since_id] = most_recent_tweet.statusid
    end
    tweets = client.user_timeline(ENV['TWITTER_USERNAME'], options)
    tweets.each do |tweet|
      TwitterStatus.find_or_create_by(statusid: tweet.id) do |t|
        t.timestamp = tweet.created_at.to_datetime
        t.data = tweet.attrs
      end
    end
    ActionCable.server.broadcast 'twitter_statuses',
                                 message: 'new tweets imported'
  end

  def self.cleanup
    TwitterStatus.is_public.order(timestamp: :desc).offset(20).destroy_all
  end

  private

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end
end
