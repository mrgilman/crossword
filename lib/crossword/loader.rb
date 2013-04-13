module Crossword
  class Loader

    ALL = 'word_lists/all.txt'
    NYT = 'word_lists/nyt.txt'

    def self.load_word_list_file(file=ALL)
      words = File.open(file).read
      words.split("\n")
    end

  end
end
