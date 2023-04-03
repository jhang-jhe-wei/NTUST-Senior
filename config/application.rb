require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NTUSTSenior
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.hosts << "test.wells.tw"
    config.hosts << "ntust-senior-chatbot.wells.tw"
    config.hosts << "ntust-senior.dokku.wells.tw"
    config.hosts << "ngrok.etrex.tw"
    config.hosts << "www.example.com"
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
