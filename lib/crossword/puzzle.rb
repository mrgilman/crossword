module Crossword
  class Puzzle
    attr_reader :grid, :word_list, :seed, :across_words_pool, :down_words_pool

    def initialize(width, height=width, word_list=Crossword::Loader.load_word_list_file)
      @grid      = Grid.new(width, height=width)
      @word_list = WordList.new(word_list)
    end

    def build!
      begin
        (0..(grid.height - 1)).to_a.each do |row|
          word = word_list.of_length(grid.width).words.sample
          cells = grid.cells.select{|c| c.x == row}.sort_by(&:y)
          word.split("").each_with_index do |letter, i|
            cells[i].letter = letter
          end
        end
      end while !valid?
    end

    def valid?
      words = (0..(grid.width - 1)).to_a.map do |column|
        grid.cells.select{|c| c.y == column}.sort_by(&:x).map(&:letter).join
      end
      words.each do |word|
        return false unless word_list.of_length(grid.height).words.include? word
      end
      true
    end

    def print
      (0..(grid.height - 1)).to_a.each do |row|
        letters = grid.cells.select{|c| c.x == row}.sort_by(&:y).map(&:letter)
        letters.each{|letter| printf "#{letter} "}; printf "\n"
      end
      nil
    end
  end
end
