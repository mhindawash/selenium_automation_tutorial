require_relative '../support/google_homepage'

Given('I navigate to Google\'s homepage') do
  @google = GoogleHomepage.new(@driver)
  @google.open_homepage
end

When('I search for {string}') do |query|
  @google.enter_search_query(query)
  @google.submit_search
end

Then('I should see results for {string}') do |query|
  expect(@google.results_include?(query)).to be true
end
