Feature: learner starts test

	In order to learn vocab
	As a learner
	I want to start a test

	Scenario: start test
		Given I have not started a test
		When the test has started
		Then the vocab file should be loaded
		And the queue should have 0 words
		And I should see "-Welcome to Vocab Tester-"
		And I should see the command info
		And I should see a word from the word list
		And I should see ">"

