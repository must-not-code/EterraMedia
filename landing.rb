#!/usr/bin/env ruby

require 'sinatra'
require 'slim'
require 'rack-google-analytics'

use Rack::GoogleAnalytics, tracker: ENV['GA_CODE']

get '/' do
  slim :index
end
