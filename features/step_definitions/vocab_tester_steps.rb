class Output
	def messages
		@messages ||= []
	end
	
	def puts(message)
		messages << message
	end
end

def output
	@output ||= Output.new
end

## starts test feature
Given /^I have not started a test$/ do
end

When /^I start a test$/ do
	@test = VocabTester::Test.new(output)
	@test.start
end

Then /^the vocab file should be loaded$/ do
	!@test.words.empty?
end

Then /^I should see "([^"]*)"$/ do |message|
	output.messages.should include(message) # output is a METHOD that returns @output / Output.new
end

Then /^I should see a word from the word list$/ do
  pending # express the regexp above with the code you wish you had
end

