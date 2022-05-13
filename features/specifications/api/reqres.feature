@reqres
Feature: Cover CRUD operations for one REST endpoint defined in reqres.in
    Feature Description

@create_scenario
Scenario Outline: Teste the create api
    When create a user "<name>", "<job>"
    Then I validate the api response "<expect>"

    Examples:
    | name         | job                      | expect |
    | Rodrigo Tani | Test Automation Engineer | 201    |
    |              | Test Automation Engineer | 400    |
    | Rodrigo Tani |                          | 400    |

    # Critical BUG 
    # route "/api/users"
    # Action: "Create"

    # Description: "The route allows creat users with blank name and job"
    # BDD - 

Scenario Outline: Scenario Outline name
    Given i visit ""
    When create a user "<name>", "<job>"
    And ew

    Examples:
    | name | job | expect |
    | Value 1  | Value 2  | Value 3  |
    

