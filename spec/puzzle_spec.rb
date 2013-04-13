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

    describe "#build_puzzle" do
      describe "4x4 puzzle" do

        let(:puzzle) { Puzzle.new(4, 4, %W{RAVE ASIA YELL BRAY EASE EVIL REAL}) }

        it "builds a 4x4 puzzle with valid words from the list" do
          puzzle.build_puzzle.should be_instance_of Grid
        end
      end
    end
  end
end
