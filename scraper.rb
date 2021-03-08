# Require library
require "capybara"
require "selenium-webdriver"

Capybara.register_driver :selenium_chrome_headless_morph do |app|
  Capybara::Selenium::Driver.load_selenium
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << '--headless'
    opts.args << '--disable-gpu' if Gem.win_platform?
    # Workaround https://bugs.chromium.org/p/chromedriver/issues/detail?id=2650&q=load&sort=-id&colspec=ID%20Status%20Pri%20Owner%20Summary
    opts.args << '--disable-site-isolation-trials'
    opts.args << '--no-sandbox'
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

# Open a Capybara session with the Selenium web driver for Chromium headless
capybara = Capybara::Session.new(:selenium_chrome_headless_morph)

capybara.visit("https:/totaljoy.co/read/")

titles = capybara.find('div')

print(titles)

# Create an empty database file just so that we don't error
FileUtils.touch('data.sqlite')
