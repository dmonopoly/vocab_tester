## User interaction feature
When /^the learner marks the word as understood$/ do
	@test.reply('.')
end

When /^the learner marks the word to be enqueued$/ do
  @test.reply('e')
end

When /^the learner makes an improper command$/ do
  @test.reply('e.')
end

