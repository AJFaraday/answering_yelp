require 'fileutils'

FileUtils.cp(
  "#{File.dirname(__FILE__)}/../config/twitter.yml.template",
  "#{File.dirname(__FILE__)}/../config/twitter.yml"
)
FileUtils.cp(
  "#{File.dirname(__FILE__)}/../config/templates.yml.template",
  "#{File.dirname(__FILE__)}/../config/templates.yml"
)
puts "Config files copied from templates"
puts "Don't forget to fill in the twitter account and application credentials"

