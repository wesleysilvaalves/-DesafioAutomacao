Feature: API Automation with Robot Framework

    Background:
        Given the base URL is "https://reqres.in"

    Scenario: Create a new user
        When I send a POST request to "/api/users" with the payload
            """
            {
                "name": "John Doe",
                "job": "Software Developer"
            }
            """
        Then the response status code should be 201
        And the response body should contain "id"
        And the response body should contain "createdAt"
        And the "id" should be a string
        And the "createdAt" should be a valid datetime

    Scenario: Get the created user
        Given I have the user ID from the create user response
        When I send a GET request to "/api/users/<user_id>"
        Then the response status code should be 200
        And the response body should contain "data"
        And the response body should contain "id"
        And the response body should contain "email"
        And the response body should contain "first_name"
        And the response body should contain "last_name"

    Scenario: Update the user
        Given I have the user ID from the create user response
        When I send a PUT request to "/api/users/<user_id>" with the payload
            """
            {
                "name": "John Doe",
                "job": "Senior Software Developer"
            }
            """
        Then the response status code should be 200
        And the response body should contain "name"
        And the response body should contain "job"
        And the "name" should be "John Doe"
        And the "job" should be "Senior Software Developer"
        And the "updatedAt" should be a valid datetime

    Scenario: Delete the user
        Given I have the user ID from the create user response
        When I send a DELETE request to "/api/users/<user_id>"
        Then the response status code should be 204

    Scenario: Get the deleted user
        Given I have the user ID from the create user response
        When I send a GET request to "/api/users/<user_id>"
        Then the response status code should be 404
        And the response body should contain "error"
        And the "error" should be "Not Found"
