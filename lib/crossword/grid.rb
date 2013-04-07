module Crossword
  class Grid
    attr_reader :width, :height

    def initialize(width, height=width)
      raise GridError, "Height and width must be numbers greater than 0" if width.to_i <= 0 || height.to_i <= 0
      @width  = width.to_i
      @height = height.to_i
    end

    class GridError < StandardError; end
  end
end
