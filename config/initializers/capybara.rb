# frozen_string_literal: true

if Rails.env.production?
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.new(app,
                                   browser: :remote,
                                   url: 'http://dokku-chrome-lolipop:3000',
                                   desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome)
  end

  Capybara.default_driver = :selenium_chrome_headless
end
