require 'yaml'
require_relative '../lib/config.rb'

config = Config.from_files

require 'twitter_oauth'
client = TwitterOAuth::Client.new(
  :consumer_key => config.twitter_config['consumer_key'],
  :consumer_secret => config.twitter_config['consumer_secret']
)
request_token = client.request_token()
puts "go to the browser and open this url to authorise your account: #{request_token.authorize_url}"
puts "What pin did it give you?"
pin = gets.chomp
access_token = client.authorize(
  request_token.token,
  request_token.secret,
  :oauth_verifier => pin
)

File.open("#{File.dirname(__FILE__)}/../config/twitter.yml", "w") do |f|
  YAML.dump(
    {
      'consumer_key' => config.twitter_config['consumer_key'],
      'consumer_secret' => config.twitter_config['consumer_secret'],
      'access_token' => access_token.token,
      'access_token_secret' => access_token.secret,
      'last_tweet_id' => nil
    },
    f
  )
end


