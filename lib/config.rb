class Config

  TEMPLATE_FILE_PATH = 'config/templates.yml'
  TWITTER_FILE_PATH = 'config/twitter.yml'

  attr_accessor :templates, :twitter_config

  def self.from_files(template_file = TEMPLATE_FILE_PATH, twitter_file = TWITTER_FILE_PATH)
    self.new(
      YAML.load_file(template_file),
      YAML.load_file(twitter_file)
    )
  end

  # Both are expected in YAML format
  def initialize(templates, twitter_config)
    @templates = templates
    @twitter_config = twitter_config
  end



end
