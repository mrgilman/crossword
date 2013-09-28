require 'spec_helper'

module Crossword
  describe Puzzle do
    describe ".initialize" do
      it "initializes a square grid with default word list with one argument" do
        puzzle = Puzzle.new(4)
        puzzle.grid.should be_instance_of Grid
        puzzle.word_list.should be_instance_of WordList
      end
    end

    describe "4x4 puzzle" do
      describe "#build_puzzle" do
        let(:puzzle) { Puzzle.new(4, 4, %W{BEER RAVE ASIA YELL BRAY EASE EVIL REAL}) }

        it "fills the cells in the grid with letters" do
          puzzle.build!
          puzzle.grid.cells.map(&:letter).should_not include nil
        end

        it "returns a grid where the first row is a word from the list" do
          puzzle.build!
          cells = puzzle.grid.cells.select{|c| c.x == 0}.map(&:letter)
          puzzle.word_list.words.should include cells.join
        end

        it "returns a grid where each row is a word from the list" do
          puzzle.build!
          words = (0..(puzzle.grid.height - 1)).to_a.map do |row|
            puzzle.grid.cells.select{|c| c.x == row}.map(&:letter).join
          end
          words.each do |word|
            puzzle.word_list.words.should include word
          end
        end

        it "keeps attempting to build the puzzle until it creates a valid one" do
          puzzle.build!
          puzzle.should be_valid
        end
      end

      describe "#valid?" do
        it "returns true if all of the down words are in the word list" do
          valid_puzzle.should be_valid
        end

        it "returns false if any of the down words are not in the word list" do
          invalid_puzzle.should_not be_valid
        end
      end
    end

    private

    def build_puzzle_with_words(words)
      puzzle = Crossword::Puzzle.new(4, 4, %W{BEER RAVE ASIA YELL BRAY EASE EVIL REAL})
      words.each_with_index do |word, i|
        row = puzzle.grid.cells.select{|c| c.x == i}.sort_by(&:y)
        row.each do |cell|
          word.split("").each_with_index do |letter, j|
            row[j].letter = letter
          end
        end
      end
      puzzle
    end

    def valid_puzzle
      build_puzzle_with_words(%W{BEER RAVE ASIA YELL})
    end

    def invalid_puzzle
      build_puzzle_with_words(%W{BEER YELL EASE EVIL})
    end
  end
end
