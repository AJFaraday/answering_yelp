require 'spec_helper'

describe Config do

  let(:templates) do
    [
      "I don't know how to",
      "I've never tried to",
      "Why do people want me to",
      "I'm allergic to the smell when I"
    ]
  end


  let(:twitter_config) do
    {
      'consumer_key' => 'consumer_key_a',
      'consumer_secret' => 'consumer_secret_a',
      'access_token' => 'access_token_a',
      'access_token_secret' => 'access_token_secret_a'
    }
  end

  it 'should initialise with from two files' do
    config = Config.new(templates, twitter_config)

    config.templates.should be_a(Array)
    config.templates.length.should eq(4)

    config.twitter_config.should be_a(Hash)
    config.twitter_config['consumer_key'].should eq('consumer_key_a')
  end

  it 'should get them automatically with from_files' do
    config = Config.from_files
    config.templates.should be_a(Array)
    config.twitter_config.should be_a(Hash)
  end

end
