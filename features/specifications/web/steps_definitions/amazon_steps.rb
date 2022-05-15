Given("I'm in AMAZOM website") do
    visit("https://www.amazon.com/")
    binding.pry

    
end

When('I search the {string} in search bar') do |item|
    $scenario_data["item"] = item
    find("#twotabsearchtextbox", wait:5).set($scenario_data["item"])
    find("#nav-search-submit-button", wait:5).click
end

When('I choose the item') do
    assert_text("RESULT", wait:5)
    find_all("span[class='a-size-medium a-color-base a-text-normal']", wait:5)[0].click
end

Then('I add it to cart') do
    find("#add-to-cart-button", wait:5).click
    assert_selector("i[class='a-icon a-icon-alert']", wait:5)
    find("#sw-atc-actions-buy-box-sign-in", wait:5).find_all(".a-button-inner").last.click
end

Then('I validate if the item is into the cart') do
    unless $scenario_data["item"] == find("span[class='a-truncate a-size-medium']", wait:5).text
        raise "The automation added the wrong item. Validate, please!"
    end
end