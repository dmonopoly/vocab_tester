require 'spec_helper'

# Guidelines: 
# one expectation per example
# have at least 1 example for each step

module VocabTester
	describe Test do		
		describe "file loading" do
			let(:output) { double('output').as_null_object }
			
			it "opens the proper text file" do
				File.should_receive(:open)
				Test.new(output)
			end
			
			it "should fill the word array" do
				test = Test.new(output)
				test.words.should_not be_empty
			end
		end
		
		describe "#start" do
			let(:output) { double('output').as_null_object }
			let(:test) { Test.new(output) }
			
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
					output.should_receive(:puts).with(". -> next word, I understand this one; e -> enqueue")
					test.start
				end
		
				it "shows a > for the user to type after" do
					output.should_receive(:puts).with(">")
					test.start
				end
			end
			
			describe "word list interactions" do
				it "shows a word from the word list" do
					test.should_receive(:next_word).and_return('some_word') # not behavior-based!
					output.should_receive(:puts).with('some_word')
			
					test.start
				end
			end
		end
		
		describe "a user" do
			let(:output) { double('output').as_null_object }
			let(:test) { Test.new(output) }
			
			context "who marks the word as understood with '.'" do
				it "should decrease the size of the word list by 1" do
					lambda { test.reply('.') }.should change(test.words, :count).by(-1)
				end
				
				it "should remove the word from the word list" do
					old_word = test.current_word
					test.reply('.')
					test.words.should_not include(old_word)
				end
				
			end
		end
		
	end
	
end
