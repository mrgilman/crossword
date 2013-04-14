require 'spec_helper'

module Crossword
  describe Cell do
    describe '.initialize' do
      it 'initializes with x and y coordinates' do
        cell = Cell.new(0,1)
        cell.x.should eq 0
        cell.y.should eq 1
      end
    end
  end
end
