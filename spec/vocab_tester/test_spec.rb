require 'spec_helper'

module VocabTester
	describe Test do
		let(:output) { double('output').as_null_object }
		let(:test) { Test.new(output) }
		
		# guideline: one expectation per example
		describe "#start" do # have at least 1 example for each "then" behavior (aka each STEP)
			it "loads the proper text file" do
				test.words.should_not be_empty # improve?
				test.start
			end
			
			it "shows a welcome message" do
				output.should_receive(:puts).with("-Welcome to Vocab Tester-")
				test.start
			end
			
			it "shows the commands heading" do
				output.should_receive(:puts).with("Commands:")
				test.start
			end
			
			it "shows the commands" do
				output.should_receive(:puts).with(". -> next word, I understand this one; e -> enqueue; d -> dequeue")
				test.start
			end
			
			it "shows a word from the word list" do
				pending "How do I test for test.words.sample? I need to use stubs."
				output.should_receive(:puts).with(test.words)
				# this is really just saying the word received must be included in the array
				
				test.start
			end
			
			it "shows a > for the user to type after" do
				output.should_receive(:puts).with(">")
				test.start
			end
			
		end
		
	end
	
end
