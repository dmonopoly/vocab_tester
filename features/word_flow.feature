Feature: word display from lists

	The two lists - the word list and the queue - should work together to provide
	a smooth user experience.

	Initially, words from the word list are randomly displayed one at a time,
	and there are no words in the queue. The user has the opportunity to enqueue.
	No words from the queue appear until the word list is exhausted.

	Once the word list has been exhausted, words from the queue
	appear one at a time, with the first one being the first enqueued and the
	last one being the last enqueued. Again, the user has the opportunity to enqueue.

	The moment all words from both the word list and the queue have been exhausted,
	the program congratulates the learner and closes.

	Scenario: word list has words
		Given the test has started
		And the word list has words
		When the next word is to be shown
		Then the next word should come from the word list

	Scenario: word list is empty but queue has words
		Given the test has started
		And the word list is empty
		But the queue has words
		When the next word is to be shown
		Then the next word should come from the queue
		And the next word should be from index 0

	Scenario: word list and queue are both empty
		Given the test has started
		And the word list is empty
		And the queue is empty
		When the next word is to be shown
		Then a congratulatory message should be shown
		And the program should close

