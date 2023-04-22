# frozen_string_literal: true

Capybara.register_driver :firefox_headless do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.args << '--headless' # enable headless mode
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.default_driver = :firefox_headless
Capybara.default_max_wait_time = 1
