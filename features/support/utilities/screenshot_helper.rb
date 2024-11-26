module ScreenshotHelper
    def take_screenshot(driver, scenario_name)
      timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
      file_name = "screenshots/#{scenario_name}_#{timestamp}.png"
      driver.save_screenshot(file_name)
      puts "Screenshot taken: #{file_name}"
    end
  end
  