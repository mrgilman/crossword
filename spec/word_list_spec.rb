require 'spec_helper'

module Crossword
  describe WordList do
    describe '.initialize' do
      it "initializes a word list from a file containing a newline-separated list" do
        list = "APPLE\nBANANA\nCHOCOLATE"
        File.should_receive(:open).and_return(stub(:read => list))
        word_list = WordList.new(list)
        word_list.words.should eq %W{APPLE BANANA CHOCOLATE}
      end
    end
  end
end
