## Steps with arguments
Then /^I should see "([^"]*)"$/ do |message|
	output.messages.should include(message)
end

Given /^the queue has (\d+) words$/ do |num|
  num.to_i.times { @test.enqueue 'a' }
end

Then /^the queue should have (\d+) words$/ do |num|
  @test.queue.should have(num.to_i).words
end

Then /^I should see "([^"]*)" last$/ do |mark|
	output.messages.last.should == mark
end

