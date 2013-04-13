module Crossword
  class Puzzle
    attr_reader :grid, :word_list, :seed, :across_words_pool, :down_words_pool

    def initialize(width, height=width, word_list=Crossword::Loader.load_word_list_file)
      @grid              = Grid.new(width, height=width)
      @word_list         = WordList.new(word_list)
    end

    def build_puzzle
      Grid.new(4)
    end
  end
end
