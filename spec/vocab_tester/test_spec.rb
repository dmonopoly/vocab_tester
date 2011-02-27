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
					output.should_receive(:print).with(">")
					test.start
				end
			end

			describe "word list interactions" do
				it "shows a word from the word list" do
					test.should_receive(:put_word_from_word_list)
					test.start
				end
			end
		end

		describe "a user" do
			let(:output) { double('output').as_null_object }
			let(:test) { Test.new(output) }

			context "who sees a word from the word list" do
			  before(:each) do
			    test.put_word_from_word_list
  	    end

				it "should remove the word from the word list" do
					test.should_receive(:remove_from_word_list)
					test.put_word_from_word_list
				end

				it "should decrease the size of the word list by 1" do
					lambda { test.put_word_from_word_list }.should change(test.words, :count).by(-1)
				end

				context "and marks the word as understood with '.'" do
					it "should not change the queue" do
						lambda { test.reply '.' }.should_not change(test.queue, :inspect)
					end
				end

				context "and marks the word to be enqueued with 'e'" do
					it "should increase the size of the queue by 1" do
						lambda { test.reply('e') }.should change(test.queue, :count).by(1)
					end

					it "should add the current word to the queue" do
						test.should_receive(:enqueue).with(test.current_word)
						test.reply('e')
					end
				end

			end

			context "who sees a word from the queue" do
				before(:each) do
					test.words.each { |word|
						test.enqueue word
					}
					test.put_word_from_queue
				end

				context "and marks the word as understood with '.'" do
					it "should remove the word from the queue" do
					  pending
						test.queue.should_not include(test.current_word)
						test.reply '.'
					end
				end

				context "and marks the word to be enqueued with 'e'" do
					it "should add the word to the queue" do
						pending
						test.queue.should include(test.current_word)
						test.reply('e')
					end
				end
			end

		end # end user
	end

end

