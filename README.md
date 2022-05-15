# Test Task: Technical QA
## Description:
You were given a task to cover a web application with automated tests (AT) in order to
determine possible bugs and have a way to do quick regression/integration testing in the
future. We would like you to demonstrate how you would do this by completing the following
tasks:

## 1. Amazon: https://www.amazon.com/
* a) Create automated test cases for login/registration and 1 major end-to-end scenario;
```ruby
        $ cucumber -t '@amazon'
```
 LOGIN and REGISTRATION I have automated the possible. Beacause there is a captcha validation
```ruby
        $  cucumber -t '@amazon_log_in'
        $  cucumber -t '@amazon_registration'
```
 The E2E scenario, I have automated de cart validation. The AT search a product item and add the item into a cart
```ruby
        $  cucumber -t '@amazon_add_item_cart'
```
## 2. Reqres: https://reqres.in/
* a) Cover CRUD operations for one REST endpoint defined in reqres.in;
```ruby
        $  cucumber -t '@reqres' HL=true
```
* b) Cover scenarios which contain usage of several endpoints;
```ruby

```
## 3. Test Cases and bugs
* a) Define 2 test cases. You can choose any from the tasks above.
```
  I used BDD to write test cases. You can see in automation specifications/{testType}/spec/{?}.feature
```
* b) Define 2 bugs with priority critical or higher. You can choose any from the tasks above.
```
 1- BUG - The route allows create users with blank name or blank job
                level: HIGHER
                route: "/api/users"
                Action: "Create"

                Description: "The route must'n allowed to create users with blank name or blank job. Please, fix this issue."
                BDD - Regression automation

                @create_scenario
                Scenario Outline: Teste the create api
                When create a user "<name>", "<job>"
                Then I validate the api response "<expect>"

                Examples:
                | name         | job                      | expect |
                | Rodrigo Tani | Test Automation Engineer | 201    |
                |              | Test Automation Engineer | 400    |
                | Rodrigo Tani |                          | 400    |

                Evidence (GIF or IMAGE):
```
![Evidence Image](imgs/bug_created.png?raw=true)

```
 2- BUG - The route accept different string than ID to delete
                level: HIGHER
                route: "/api/users"
                Action: "Delete"

                Description: "The route must only delete with ID. I tried to put /api/users/"anyString" and I get 204 in response code. Please, fix this issue."
                BDD - Regression automation

                @read_scenario
                Scenario Outline: Teste the create api
                    When read a user "<user_id>"
                    Then I validate the api response "<expect>"
    
                    Examples:
                        | user_id  |
                        | 1        |
                        | Rodrigo  |

                Evidence (GIF or IMAGE):
```
![Evidence Image](imgs/bug_created.png?raw=true)

## 4. Documentation
a) A short description of the approach you would use for AT for the first 2 tasks. The
description should clarify things like:
- What tools / frameworks would you use for AT?
- What would be used for each tool?
- What parts of the app you would apply AT to?
- Anything else you want to mention.
Note: The estimated time for the tasks 6-8 hours

 My stack is RUBY + CUCUMBER + CAPYBARA + SELENIUM + HTTPARTY
 Selenium for UI tests and HTTPARTY for API test. I prefer using cucumber to automate using BDD. Because, BDD is a easy way to everyone understand the automation's steps.
 I would apply a REGISTER validate.
 I added a dockerfile to make more easy to setup de environment and execute the automation.

## Dependencies

* Ruby 3.0.3

## Installation Instructions

### Recommendations

* Use RVM to handle rubies and gemsets

* See installation instructions here (https://rvm.io/rvm/install)

* Install bundler

        $ gem install bundler

* Project Installation

        $ git clone https://github.com/RodrigoTani/scopic_test.git
        $ bundle install

## Ruby Installation - (https://www.ruby-lang.org/pt/documentation/installation/)
* Windows: https://rubyinstaller.org/downloads/
* Linux: 
        $ sudo apt-get install ruby-full
* macOS: 
        brew install ruby

After installation, you need to download the Chromedriver
* Chromedriver: https://chromedriver.chromium.org/downloads

After downloaded, extract .rar file and add the file 'chromedriver.exe' into this path C:\Ruby30-x64\bin
