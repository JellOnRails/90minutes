require 'capybara'

#Firefox
Capybara.register_driver :firefox do | app |
  Capybara::Selenium::Driver.new( app )
end

#Chrome
Capybara.register_driver :chrome do | app |
  Capybara::Selenium::Driver.new( app, browser: :chrome )
end

Capybara.default_wait_time = 10
Capybara.default_selector = :css

Capybara.default_driver = ( ENV['DRIVER'] || :firefox ).to_sym