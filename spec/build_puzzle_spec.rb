require 'spec_helper'

describe "build a puzzle" do
  it "builds a puzzle" do
    Crossword::Puzzle.new(4).build!
  end
end
