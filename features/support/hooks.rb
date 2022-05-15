# Driver Configuration
  # API
if HEADLESS == "true"
  Capybara.register_driver :chrome_headless do |app|
    options = ::Selenium::WebDriver::Chrome::Options.new

    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--window-size=1400,1400')

    Capybara::Selenium::Driver.new(app, {browser: :chrome, options: options})
  end

  Capybara.configure do |config|
    config.default_driver = :chrome_headless
  end

else 
  Capybara.register_driver :selenium do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120
    
    options = ::Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--incognito")
    options.add_argument("--ignore-certificate-errors")
    options.add_argument("--ignore-certificate-errors-spki-list")
    options.add_argument("--ignore-ssl-errors")
    options.add_argument('log-level=3')

    Capybara::Selenium::Driver.new(app, browser: :chrome, http_client: client, options: options)
  end

  Capybara.configure do |config|
    config.default_driver = :selenium 
  end
end

$scenario_data = {}
Before do |scenario|
  if HEADLESS == "false"
    Capybara.page.driver.browser.manage.window.maximize
  end
end

After do |scenario|
end

at_exit do
end

