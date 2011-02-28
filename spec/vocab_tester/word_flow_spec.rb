require 'spec_helper'

module VocabTester
	describe Test do
		describe "word flow" do
	    let(:output) { double('output').as_null_object }
	    let(:test) { Test.new(output) }

      context "when word list has 1 word ('word_1')" do
        before(:each) do
          test.words.clear
          test.add_to_word_list 'word_1'
        end

  	    it "should show this word from the word list" do
          output.should_receive(:puts).with('word_1')
	      end

      end

      context "when word list is empty but queue has words" do
      end
    end

  end

end

