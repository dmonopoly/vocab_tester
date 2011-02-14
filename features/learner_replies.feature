Feature: learner replies with a command

	The learner replies with a variety of commands to show whether he knows the term or not.
	
	Scenario: word understood
		When the learner marks the word as understood
		Then the word list's size should decrease by 1
