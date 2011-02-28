## Any steps that involve word_list or queue
Given /^the word is from the word list$/ do
  # start test already ensures these contents, but this is implemented anyway to reduce dependencies
  # here: making sure certain words are in the word list
  @test.words.clear
  [ 'word_1','word_2','word_3','word_4' ].each { |word| @test.add_to_word_list word }
	@test.put_word_from_word_list
end

And /^the word is from the queue$/ do # so the queue must have words!
	[ 'queue_word_1','queue_word_2','queue_word_3','queue_word_4' ].each { |word| @test.enqueue word }
	@test.put_word_from_queue
end

Then /^the word should be removed from the word list$/ do
	@test.words.should_not include(@test.current_word)
end

Then /^the word should be enqueued$/ do
	@test.queue.should include(@test.current_word)
end

Then /^the word should be dequeued$/ do
  @test.queue.should_not include(@test.current_word)
end

Then /^the word should remain enqueued$/ do
  Then 'the word should be enqueued'
end

Given /^the word list has words$/ do
  @test.words.clear
  [ 'word_1','word_2','word_3','word_4' ].each { |word| @test.add_to_word_list word }
end

