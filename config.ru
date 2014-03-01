# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'rack/google_analytics'
require 'uri'
require 'net/http'

use Rack::GoogleAnalytics, :web_property_id => "UA-9997784-10"
run Epure::Application
