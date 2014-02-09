require 'bundler/setup'
require 'minitest/autorun'
require 'rack/test'

root = File.expand_path "../../", __FILE__
require "#{root}/app"
