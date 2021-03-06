class TwitterClient

  WATCHING_ACCOUNT = 'hard_to_yelp'

  def initialize(config)
    config.each do |key, value|
      self.instance_variable_set("@#{key}", value)
    end
    @client = get_client
  end

  def latest_tweet
    return @latest_tweet if @latest_tweet
    @latest_tweet = @client.user_timeline(WATCHING_ACCOUNT, count: 1)[0]
    set_last_tweet_id(@latest_tweet.id)
    @latest_tweet
  end

  def latest_tweet_done?
    @last_tweet_id == latest_tweet.id
  end

  def send_tweet(text)
    @client.update(
      text,
      in_reply_to_status_id: latest_tweet.id
    )
  end

  private

  def get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = @consumer_key
      config.consumer_secret = @consumer_secret
      config.access_token = @access_token
      config.access_token_secret = @access_token_secret
    end
  end

  def set_last_tweet_id(id)
    twitter_config = YAML.load_file("#{File.dirname(__FILE__)}/../config/twitter.yml")
    twitter_config['last_tweet_id'] = id
    File.open("#{File.dirname(__FILE__)}/../config/twitter.yml", "w") do |f|
      YAML.dump(twitter_config, f)
    end
  end

end