require 'spec_helper'

module Crossword
  describe Grid do
    describe '.initialize' do
      it 'initializes a grid composed of cells' do
        grid = Grid.new(15, 10)
        grid.cells.count.should eq 15*10
      end

      it 'initializes a square when given one argument' do
        grid = Grid.new(15)
        grid.cells.count.should eq 15*15
      end

      it 'raises GridError when given 0 as an argument' do
        expect{Grid.new(0)}.to raise_error Grid::GridError
      end

      it 'raises GridError when given non-number as an argument' do
        expect{Grid.new("a", "b")}.to raise_error Grid::GridError
      end
    end
  end
end
