Feature: clear interface

    In order to have a good user interface
    As a learner
    I want to see clarification marks

    Scenario: word from word list just displayed
        Given the test has started
        When the word is from the word list
        Then I should see ">" last

    Scenario: word from queue just displayed
        Given the test has started
        When the word is from the queue
        Then I should see ">" last

