require "bundler"
Bundler.require(:default)

require './sox.rb'
run Sinatra::Application
