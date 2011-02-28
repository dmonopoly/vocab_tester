## Start test feature
Given /^I have not started a test$/ do
end

When /^I start a test$/ do
	@test = VocabTester::Test.new(output)
	@test.start
end

Then /^the vocab file should be loaded$/ do
	@test.words.should_not be_empty
end

Then /^I should see the command info$/ do
	Then 'I should see "Commands:"'
	And 'I should see ". -> next word, I understand this one; e -> enqueue"'
end

Then /^I should see a word from the word list$/ do
  output.messages.should include(@test.current_word)
end

