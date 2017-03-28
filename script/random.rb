require_relative '../lib/environment.rb'

config = Config.from_files
twitter_client = TwitterClient.new(config.twitter_config)

tweet_hash = twitter_client.get_random_tweet

tweet_hash[:text] = Generator.new(tweet_hash[:text], config.templates).run

puts tweet_hash.inspect
