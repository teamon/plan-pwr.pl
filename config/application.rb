require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Epure
  class Application < Rails::Application
    config.cache_store = :redis_store, "#{ENV["REDIS_URL"] || "redis://localhost:6379/0"}/plan-pwr:#{Rails.env}:cache"

    config.generators do |g|
      g.helper      false
      g.stylesheets false
      g.javascripts false
      g.view_specs  false
      g.test_framework false
    end

    config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # For nginx

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :en
  end
end

