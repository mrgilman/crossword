module Crossword
  class WordList
    attr_reader :words

    def initialize(words)
      @words = words
    end

    def of_length(length)
      WordList.new(words.select{|w| w.length == length})
    end

    def letter_in_position(letter, position)
      WordList.new(words.select{|w| w[position - 1] == letter})
    end
  end
end
