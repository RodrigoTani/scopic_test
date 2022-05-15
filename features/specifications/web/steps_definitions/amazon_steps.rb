#Common Step
    Given("I'm in AMAZOM website") do
        visit("https://www.amazon.com/")
    end

#AMAZON Registrations
    When('I start the registration') do
        @amazon = AmazonPage.new
        ap_password = "Mypassword#"
        email = "rodrigo.tani@scopic.com"

        @amazon.registration(email, ap_password)
    end

    Then('I validate if the user was created') do
        pending # To code this step, we need to pass the captcha validation first.
    end

#AMAZON LOG IN
    When('I start the login {string}, {string}') do |email, ap_password|
        @amazon = AmazonPage.new
        @amazon.log_in(email, ap_password)
    end
  
    Then('I validate if the user was loged') do
        pending # To code this step, we need to pass the login first.
    end

# E2E scenario
    When('I search the {string} in search bar') do |item|
        $scenario_data["item"] = item
        find("#twotabsearchtextbox", wait:5).set($scenario_data["item"])
        find("#nav-search-submit-button", wait:5).click
    end

    When('I choose the item') do
        assert_text("RESULT", wait:5)
        find_all("span[class='a-size-medium a-color-base a-text-normal']",text: $scenario_data["item"], wait:5)[0].click
    end

    Then('I add it to cart') do
        find("#add-to-cart-button", wait:5).click
        assert_selector("i[class='a-icon a-icon-alert']", wait:5)
        find("#sw-atc-actions-buy-box-sign-in", wait:5).find_all(".a-button-inner").last.click
    end

    Then('I validate if the item is into the cart') do
        unless $scenario_data["item"] == find("div[class='sc-list-item-content']",wait: 5).text.split("\n").first
            raise "The automation added the wrong item. Validate, please!"
        end
    end