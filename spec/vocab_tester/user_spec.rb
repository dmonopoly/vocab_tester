require 'spec_helper'

module VocabTester
  describe Test do
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

        context "and has 5 words in the queue" do
          before(:each) do
            5.times { test.enqueue 'a' }
          end

		      context "and marks the word as understood with '.'" do
			      it "should keep the queue at size 5" do
				      test.reply '.'
				      test.queue.size.should be 5 # be careful with order
			      end

			      it "should not call dequeue" do
			        test.should_not_receive(:dequeue)
			        test.reply '.'
		        end
		      end

		      context "and marks the word to be enqueued with 'e'" do
		        it "should increase the queue's size to 6" do
		          test.reply 'e'
		          test.queue.size.should be 6 # be careful... you said "be", not "increase..."
	          end

			      it "should add the current word to the queue" do
				      test.should_receive(:enqueue).with(test.current_word)
				      test.reply('e')
			      end
		      end

        end

	    end

	    context "who sees a word from the queue (which has 5 words)" do
		    before(:each) do
			    %w[ word_1 word_2 word_3 word_4 word_5 ].each { |word|
				    test.enqueue word # filling up the queue
			    }
			    test.put_word_from_queue
		    end

		    context "and marks the word as understood with '.'" do
			    it "should remove the word from the queue" do
				    test.should_receive(:dequeue).with(test.current_word)
				    test.reply '.'
			    end

			    it "should decrease the size of the queue by 1" do
			      lambda { test.reply '.' }.should change(test.queue, :size).by(-1)
		      end
		    end

		    context "and marks the word to be enqueued with 'e'" do
			    it "should add the word to the queue" do
			      test.should_receive(:enqueue).with(test.current_word)
				    test.reply('e')
			    end
		    end
	    end

	  end # end user
  end

end

