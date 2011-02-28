## User interaction feature
When /^the learner marks the word as understood$/ do
	@test.reply('.')
end

When /^the learner marks the word to be enqueued$/ do
  @test.reply('e')
end

