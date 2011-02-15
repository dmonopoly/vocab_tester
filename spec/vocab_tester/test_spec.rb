require 'spec_helper'

module VocabTester
	describe Test do
		let(:output) { double('output').as_null_object }
		let(:test) { Test.new(output) }
		
		describe "#start" do
			it "loads the proper text file" do # improve?
				test.words.should_not be_empty
				test.start
			end
			
			it "shows a welcome message" do
				output.should_receive(:puts).with("-Welcome to Vocab Tester-")
				test.start
			end
			
			it "shows the command list"
			it "shows a word from the word list"
			it "shows a > for the user to type before"
			
		end
		
	end
end
