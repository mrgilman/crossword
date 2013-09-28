module Crossword
  class Loader

    ALL = 'word_lists/all.txt'
    NYT = 'word_lists/nyt.txt'
    FLW = 'word_lists/four_letter_words.txt'

    def self.load_word_list_file(file=FLW)
      words = File.open(file).read
      words.split("\n")
    end

  end
end
