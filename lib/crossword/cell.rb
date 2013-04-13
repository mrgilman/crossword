module Crossword
  class Cell
    attr_reader :x, :y, :letter

    def initialize(x, y)
      @x      = x
      @y      = y
      @letter = nil
    end
  end
end
