@amazon
Feature: Teste AMAZON's website

@amazon_registration
Scenario: Register into AMAZON's website
    Given I'm in AMAZOM website
    When I start the registration
    Then I validate if the user was created

@amazon_log_in
Scenario: Log in AMAZON's website
    Given I'm in AMAZOM website
    When I start the login "rodrigo.tani@scopic.com", "password"
    Then I validate if the user was loged

@amazon_add_item_cart
Scenario Outline: Add Item into cart
    Given I'm in AMAZOM website
    When I search the "<Item>" in search bar
    And I choose the item
    Then I add it to cart
    And I validate if the item is into the cart

    Examples:

    | Item                                                        |
    | PlayStation DualSense Wireless Controller – Galactic Purple |