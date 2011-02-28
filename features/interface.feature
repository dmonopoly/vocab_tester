Feature: clear interface

    In order to have a good user interface
    As a learner
    I want to see clarification marks

    Scenario: indicator for user to type (>)
        Given the test has started
        When the user can type
        Then I should see ">"

