module Crossword
  class Cell
    attr_reader   :x, :y
    attr_accessor :letter

    def initialize(x, y)
      @x = x
      @y = y
    end
  end
end
