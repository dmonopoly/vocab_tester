require 'spec_helper'

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
		end # end 'start'

    describe 'interface' do
			let(:output) { double('output').as_null_object }
			let(:test) { Test.new(output) }
		  before(:each) do
		    test.start
      end

      it "should show a > after a word is displayed from the word list" do
				output.should_receive(:print).with(">")
        test.put_word_from_word_list
      end

      it "should show a > after a word is displayed from the queue" do
        output.should_receive(:print).with(">")
        test.put_word_from_queue
      end
    end

	end

end

