class GoogleHomepage
    GOOGLE_URL = 'https://www.google.com'.freeze
  
    def initialize(driver)
      @driver = driver
    end
  
    def open_homepage
      @driver.navigate.to GOOGLE_URL
    end
  
    def enter_search_query(query)
      search_box = @driver.find_element(name: 'q')
      search_box.send_keys(query)
    end
  
    def submit_search
      search_box = @driver.find_element(name: 'q')
      search_box.submit
    end
  
    def results_include?(query)
      sleep 2 # Wait for results to load
      results = @driver.find_elements(css: 'h3')
      results.any? { |result| result.text.include?(query) }
    end
  end
  