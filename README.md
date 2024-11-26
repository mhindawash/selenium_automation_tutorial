# Selenium Automation Tutorial with Cucumber & Ruby

Welcome! This guide isn't just another tutorial; it's a compilation of my personal journey with Selenium, Cucumber, and Ruby, addressing many gaps I found in existing resources when I was just starting.

As a self-taught software professional, I've often found that many tutorials out there don't quite hit the mark. They either assume too much prior knowledge or skip over the nuances that can make or break your understanding of a tool. When I learned Selenium with Ruby and Cucumber, I faced these issues, and it's those very gaps this tutorial aims to fill.

So, whether you're a complete beginner or someone with some exposure to Selenium, Cucumber, and Ruby, this guide is for you. Here, I'll walk you through the process of setting up your environment, writing your first automation test, and integrating Cucumber with Selenium in Ruby.

Let's get started and master Selenium, Cucumber, and Ruby together!

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Writing Your First Test](#writing-your-first-test)
- [Running Your Test](#running-your-test)
- [Next Steps](#next-steps)
- [Useful Resources](#useful-resources)

## Introduction

Selenium is a powerful browser automation tool for web applications, while Cucumber allows you to write tests in a natural, human-readable language. Using these two together with Ruby allows us to create readable, maintainable, and reliable automation scripts.

In this tutorial, we'll integrate Selenium with Cucumber and Ruby to write an end-to-end automated test.

## Prerequisites

Before diving into the tutorial, ensure you have the following installed:
1. Ruby -- Install Ruby from official site.
2. Bundler – Install Bundler for managing Ruby gem dependencies: gem install bundler.
3. Cucumber – For BDD-style testing: gem install cucumber.
4. Selenium WebDriver gem – For browser automation: gem install selenium-webdriver.
5. ChromeDriver – ChromeDriver should be installed, matching your installed Chrome version.

## Installation

### Step 1: Install Ruby and Bundler
First, ensure [Ruby](https://rubyinstaller.org/) is installed on your machine. After that, install Bundler, a tool for managing dependencies in Ruby projects.
```
gem install bundler
```

### Step 2: Create Your Project Directory
Create a new directory for your project and navigate into it.
```
mkdir selenium_cucumber_ruby_project
cd selenium_cucumber_ruby_project
```

### Step 3: Initialize Your Project
Now, initialize a new Gemfile in the directory. This file will list all of the gems that are required for your project.
```
bundle init
```

### Step 4: Add Gems to Gemfile
In your Gemfile, add the following gems for Selenium, Cucumber, and other necessary dependencies.
```
# Gemfile
source 'https://rubygems.org'

gem 'selenium-webdriver', '~> 4.9.0'
gem 'cucumber', '~> 6.0'
gem 'rspec', '~> 3.10'
gem 'webdrivers', '~> 5.0'
```

### Step 5: Install the Gems
Install the required gems by running:
```
bundle install
```

### Step 6: Install ChromeDriver
To run Selenium tests with Chrome, you'll need to install ChromeDriver. You can manually download it from [here](https://developer.chrome.com/docs/chromedriver/downloads), or use the webdrivers gem (installed above), which will handle it automatically.

## Writing Your First Test

### Step 1: Create the Feature File for Cucumber
Now let’s write a Cucumber feature file. Create a folder features in your project directory and a file login.feature inside it.
```gherkin
Feature: Login functionality

  Scenario: Successful login
    Given I am on the login page
    When I enter valid credentials
    Then I should see the homepage
```

### Step 2: Create the Step Definitions
Inside the features/step_definitions directory, create a file login_steps.rb where you'll define the steps for your feature.
```ruby
# login_steps.rb
Given('I am on the login page') do
  @driver = Selenium::WebDriver.for :chrome
  @driver.get "http://example.com/login"
end

When('I enter valid credentials') do
  @driver.find_element(name: 'username').send_keys("myusername")
  @driver.find_element(name: 'password').send_keys("mypassword")
  @driver.find_element(name: 'submit').click
end

Then('I should see the homepage') do
  expect(@driver.current_url).to eq("http://example.com/home")
  @driver.quit
end
```

### Step 3: Create the Cucumber Configuration
Ensure you have a cucumber.yml configuration file that points to your feature files and step definitions.
```yaml
# cucumber.yml
default: --format pretty --require features/step_definitions/**/*.rb features/**/*.feature
```

## Running Your Test

To run your test, execute the following command from your project directory:
```bash
cucumber
```
This will run the feature, and you should see Selenium launching Chrome, logging in, and verifying the homepage.

## Next Steps

Congratulations on completing the initial setup and testing process! Here are some steps you can follow to enhance your Selenium + Cucumber automation framework:

1. **Add More Tests**: Start writing more advanced tests for your application. Experiment with different Selenium actions and assertions.

2. **Add Hooks for Setup & Teardown**: Use Cucumber hooks (`@Before`, `@After`) to set up and clean up before and after each test scenario.

3. **Integrate Reporting**: Use tools like Cucumber Reports or Allure for better test reporting.

4. **Run Tests in Parallel**: Explore running tests in parallel to speed up your test execution using tools like Selenium Grid.

5. **Extend Framework**: As your test suite grows, consider extending your framework with reusable step definitions and custom Selenium commands.


## Useful Resources

- [Selenium Official Documentation](https://www.selenium.dev/documentation/en/)
- [Cucumber Official Documentation](https://cucumber.io/docs/guides/)
- [Ruby Official Documentation](https://www.ruby-lang.org/en/documentation/)
- [WebDriver Official Documentation](https://www.selenium.dev/documentation/webdriver/)
- [Selenium WebDriver API Documentation](https://www.selenium.dev/selenium/docs/api/ruby/)

Happy Automating!
