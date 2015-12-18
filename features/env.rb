require "selenium-webdriver"
require 'capybara/cucumber'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)
end
#Capybara.default_wait_time = 5

Capybara.configure do |config|
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
end
