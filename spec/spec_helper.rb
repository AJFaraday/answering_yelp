require 'rspec'
Dir["#{File.dirname(__FILE__)}/../lib/*.rb"].each {|file| require file }
require 'ostruct'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should]
  end
end
