Feature: learner starts test

	In order to learn vocab
	As a learner
	I want to start a test
	
	Scenario: start test
		Given I have not started a test
		When I start a test
		Then the vocab file should be loaded
		And I should see "-Welcome to Vocab Tester-"
		And I should see "Commands:"
		And I should see ". -> word understood, get next one; e -> enqueue; d -> dequeue"
		And I should see a word from the word list
		And I should see ">"
		
