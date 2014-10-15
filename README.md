90minutes
=========

test project for Atlassian

------
Short description of tools and used framework

  For implementation automation scenarious was used Cucumber as a framework, 
  selenium webdriver as a driver, Capybara + SitePrism - page object solution.
  Tests could be run on Firefox or Chrome browser.
  For test report was used Cucumber native solution.
  And of course Ruby as a programming language.

------
Requirements

1. ruby 2.0.0-p481 or higher
2. preinstalled gems 
[ You could install all neccessary gems by using next commands:
gem install bundler
*navigate to root folder of the project with 'Gemfile' file*
bundle install ]
3. installed browser - Firefox or Chrome
4. internet connection =)

------
Manual

Navigate to the root project directory and run command "cucumber".
All test will be run using Firefox browser. 
For running tests on Chrome browser you could use next command "cucumber DRIVER=chrome" 
( possible you will need  to install additional selenium driver for Chrome browser ).

Report you could find in 'Report' folder. It is 'Report.html' file which updates after each run.
