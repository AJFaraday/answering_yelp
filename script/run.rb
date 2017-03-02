require_relative '../lib/environment.rb'

config = Config.from_files
twitter_client = TwitterClient.new(config.twitter_config)

#unless twitter_client.latest_tweet_done?
generator = Generator.new(twitter_client.latest_tweet.text, config.templates)
tweet_text = generator.run
puts tweet_text
twitter_client.send_tweet(tweet_text)
#end


