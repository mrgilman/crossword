module Crossword
  class Puzzle
    attr_reader :grid, :word_list

    def initialize(width, height=width, word_list=Crossword::Loader.load_word_list_file)
      @grid      = Grid.new(width, height=width)
      @word_list = WordList.new(word_list)
    end

    def build!
      begin
        rows.each do |row|
          fill_row(row)
        end
      end while !valid?
    end

    def valid?
      down_words.each do |word|
        return false unless word_list.has_word? word
      end
      true
    end

    def print
      across_words.each do |word|
        word.each_char { |c| printf "#{c} " }; printf "\n"
      end
      nil
    end

    private

    def rows
      (0..(grid.height - 1))
    end

    def columns
      (0..(grid.width - 1))
    end

    def across_words
      rows.map do |row|
        grid.cells_in_row(row).map(&:letter).join
      end
    end

    def down_words
      columns.map do |column|
        grid.cells_in_column(column).map(&:letter).join
      end
    end

    def fill_row(row)
      word = word_list.pick_word(grid.width)
      cells = grid.cells_in_row(row)
      word.chars.each_with_index do |letter, i|
        cells[i].letter = letter
      end
    end
  end
end
