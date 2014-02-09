ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'minitest/autorun'
require 'rack/test'

root = File.expand_path "../../", __FILE__
require "#{root}/app"

Mail.defaults do
  delivery_method :test
end
