## Starts test feature
Given /^I have not started a test$/ do
end

When /^I start a test$/ do
	@test = VocabTester::Test.new(output)
	@test.start
end

Then /^the vocab file should be loaded$/ do
	@test.words.should_not be_empty
end

Then /^I should see "([^"]*)"$/ do |message|
	output.messages.should include(message)
end

Then /^I should see the command info$/ do
	Then 'I should see "Commands:"'
	And 'I should see ". -> next word, I understand this one; e -> enqueue"'
end

Then /^I should see a word from the word list$/ do
  output.messages.should include(@test.current_word)
end

## User interaction feature
Given /^the test has started$/ do
	When 'I start a test'
end

Given /^the word is from the word list$/ do
  # start test already ensures these contents, but this is implemented anyway to reduce dependencies
  # word list must already have words b/c of start test... have this clarified in the other feature!
	@test.put_word_from_word_list
end

And /^the word is from the queue$/ do # so the queue must have words!
	[ 'sample','words','in','queue' ].each { |word| @test.enqueue word }
	@test.put_word_from_queue
end

When /^the learner marks the word as understood$/ do
	@test.reply('.')
end

Then /^the word should be removed from the word list$/ do
	@test.words.should_not include(@test.current_word)
end

Given /^the queue has (\d+) words$/ do |num|
  num.to_i.times { @test.enqueue 'a' }
end

Then /^the queue should have (\d+) words$/ do |num|
  @test.queue.should have(num.to_i).terms
end

When /^the learner marks the word to be enqueued$/ do
  @test.reply('e')
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

