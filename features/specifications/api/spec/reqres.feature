@reqres
Feature: Cover CRUD operations for one REST endpoint defined in reqres.in

@create_scenario
Scenario Outline: Teste the create api
    When create a user "<name>", "<job>"
    Then I validate the api response "<expect>"

    Examples:
    | name         | job                      | expect |
    | Rodrigo Tani | Test Automation Engineer | 201    |
    |              | Test Automation Engineer | 400    |
    | Rodrigo Tani |                          | 400    |

@read_scenario
Scenario Outline: Teste the create api
    When read a user "<user_id>"
    Then I validate the api response "<expect>"
    
    Examples:
        | user_id  |
        | 1        |
        | Rodrigo  |

@delete_scenario
Scenario Outline: Teste the create api
    When delete a user "<user_id>"
    Then I validate the api response "<expect>"
    
    Examples:
        | user_id  |
        | 1        |
        | Rodrigo  |
@list
Scenario: Validate list Users
    When I validate the list users api