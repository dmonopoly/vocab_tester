require 'spec_helper'

# Guidelines: 
# one expectation per example
# have at least 1 example for each step

module VocabTester
	describe Test do
		let(:output) { double('output').as_null_object }
		let(:test) { Test.new(output) }
		
		describe "file loading" do
			it "opens the proper text file" do
				File.should_receive(:open).with('words/words.txt', 'r')
				Test.new(output)
			end
			
			it "should give the word array words" do
				test.words.should_not be_empty
				Test.new(output)
			end
		end
		
		describe "initial messages" do
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
				pending "currently modifying the main method"
				words = double('words')
				words.should_receive(:sample).and_return('quixotic')
				output.should_receive(:puts).with('quixotic')
				test.start
			end
		
			it "shows a > for the user to type after" do
				output.should_receive(:puts).with(">")
				test.start
			end
			
		end
		
	end
	
end
