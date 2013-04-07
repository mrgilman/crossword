class WordList
  attr_reader :words

  ALL = 'word_lists/all.txt'
  NYT = 'word_lists/nyt.txt'

  def initialize(list=ALL)
    f = File.open(list).read
    @words = f.split("\n")
  end
end
