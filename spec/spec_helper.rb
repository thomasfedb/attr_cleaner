require "bundler"

if ENV["TRAVIS_CI"]
  Bundler.require
else
  Bundler.require(:default, :tools)
end

ActiveRecord::Base.send(:include, AttrCleaner::Model)

RSpec.configure do |config|
  config.order = "random"
end
