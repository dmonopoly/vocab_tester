## starts test feature
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
  (output.messages & @test.words).should have_at_least(1).common_word
end

## replies feature
Given /^the test has started$/ do
	@test = VocabTester::Test.new(output)
	@test.start
end

When /^the learner marks the word as understood$/ do
	@test.reply('.')
end

Then /^the word should be removed from the word list$/ do
	@test.words.should_not include(@test.current_word)
end

