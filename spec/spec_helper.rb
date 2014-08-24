require 'bundler/setup'
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
# require 'rspec'
# require './lib/chapter'
# require './lib/adventure'
# require './lib/adventurer'