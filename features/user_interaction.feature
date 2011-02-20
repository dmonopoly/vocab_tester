Feature: learner replies with a command

	The learner replies with a variety of commands to show whether he knows the term or not.
	
	Commands include:
	".", which means the user understands the word, should not see this word again,
	and should move on to a new word.
	"e", which means enqueue, so the word should be added to the queue. The next word should 
	appear once the current word is enqueued.
	
	Scenario: word from word list understood
		Given the test has started
		And the word is from the word list
		When the learner marks the word as understood
		Then the word should be removed from the word list
		
	Scenario: word from word list to be enqueued
		Given the test has started
		And the word is from the word list
		When the learner marks the word to be enqueued
		Then the word should be enqueued
		And the word should be removed from the word list
		
	Scenario: word from queue understood
		Given the test has started
		And the word is from the queue
		When the learner marks the word as understood
		Then the word should be removed from the queue
