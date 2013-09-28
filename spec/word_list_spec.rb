require 'spec_helper'

module Crossword
  describe WordList do
    describe '.initialize' do
      it "initializes a word list from a newline-separated list" do
        list = %W{APPLE BANANA CHOCOLATE}
        word_list = WordList.new(list)
        word_list.words.should eq %W{APPLE BANANA CHOCOLATE}
      end
    end

    describe '#of_length' do
      let(:word_list) { WordList.new(%W{APPLE BANANA CHOCOLATE DAIRY EGG}) }

      it "contains words of specified length" do
        word_list.of_length(5).words.should include "APPLE"
        word_list.of_length(5).words.should include "DAIRY"
      end

      it "does not contain words other than specified length" do
        word_list.of_length(5).words.should_not include "BANANA"
        word_list.of_length(5).words.should_not include "CHOCOLATE"
        word_list.of_length(5).words.should_not include "EGG"
      end
    end
  end
end
