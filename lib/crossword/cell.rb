module Crossword
  class Cell
    attr_reader :x, :y, :letter

    def initialize(x, y)
      @x      = x
      @y      = y
    end

    def letter=(letter)
      @letter = letter
    end
  end
end
