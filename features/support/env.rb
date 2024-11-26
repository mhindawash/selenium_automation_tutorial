require 'selenium-webdriver'
require 'cucumber'

# Ensure 'screenshots' folder exists
Dir.mkdir('screenshots') unless File.directory?('screenshots')

# Check the HEADLESS environment variable (default to true for headless mode)
headless = ENV['HEADLESS'] == 'true' ? true : false

Before do |scenario|
  options = Selenium::WebDriver::Firefox::Options.new

  # Check if the scenario has the @no_headless tag
  if scenario.source_tag_names.include?('@no_headless') || !headless
    puts "Running with a visible browser (headless mode disabled)."
  else
    options.add_argument('--headless')
    puts "Running in headless mode."
  end

  # Initialize the WebDriver with the specified options
  @driver = Selenium::WebDriver.for(:firefox, options: options)
end

After do |scenario|
  # Save a screenshot if the scenario fails
  if scenario.failed?
    screenshot_name = "#{scenario.name.gsub(' ', '_')}.png"
    screenshot_path = File.join('screenshots', screenshot_name)
    @driver.save_screenshot(screenshot_path)
    puts "Screenshot saved to #{screenshot_path}"
  end

  # Quit the WebDriver
  @driver.quit
end
