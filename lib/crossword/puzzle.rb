module Crossword
  class Puzzle
    attr_reader :grid, :word_list, :vertical_words

    def initialize(width, height=width, word_list=Crossword::Loader.load_word_list_file)
      @grid      = Grid.new(width, height=width)
      @word_list = WordList.new(word_list)
      @vertical_words = @word_list.of_length(grid.height).words
      @fill_row_count = 0
    end

    def build!
      pick_first_word
      begin
        solve_puzzle
      end while !valid?
      print
    end

    def valid?
      down_words.each do |word|
        return false unless word_list.has_word? word
      end
      true
    end

    def print
      puts "Fill row count: #{@fill_row_count}"
      across_words.each do |word|
        word.each_char { |c| printf "#{c} " }; printf "\n"
      end
      nil
    end

    private

    def build_potential_solution
      rows.each do |row|
        fill_row(row)
      end
    end

    def pick_first_word
      pick_nth_word 1
    end

    def solve_puzzle
      (2..grid.height).each do |n|
        begin
          pick_nth_word n
        end while !next_word_is_valid?
      end

    end

    def pick_nth_word(n)
      n = n-1

      fill_row(n)
    end

    def next_word_is_valid?
      down_words.all? do |substring|
        vertical_words.any? {|word| word.start_with? substring }
      end
    end

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
      @fill_row_count += 1
      puts "count: #{@fill_row_count}"
      word = word_list.pick_word(grid.width)
      cells = grid.cells_in_row(row)
      word.chars.each_with_index do |letter, i|
        cells[i].letter = letter
      end
    end
  end
end
