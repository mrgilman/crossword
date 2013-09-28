crossword
=========

Crossword puzzle generator in Ruby.

Runs in irb:
```ruby
2.0.0p247 :001 > load 'lib/crossword.rb'
true
2.0.0p247 :002 > puzzle = Crossword::Puzzle.new(4, 4, %W{ ASIA BEER BRAY EASE EVIL RAVE REAL YELL })
#<Crossword::Puzzle:0x007fe618ccbcc0 @grid=#<Crossword::Grid:0x007fe618ccbc98 @width=4, @height=4, @cells=[#<Crossword::Cell:0x007fe618ccbc48 @x=0, @y=0>, #<Crossword::Cell:0x007fe618ccbc20 @x=0, @y=1>, #<Crossword::Cell:0x007fe618ccbbf8 @x=0, @y=2>, #<Crossword::Cell:0x007fe618ccbbd0 @x=0, @y=3>, #<Crossword::Cell:0x007fe618ccbba8 @x=1, @y=0>, #<Crossword::Cell:0x007fe618ccbb80 @x=1, @y=1>, #<Crossword::Cell:0x007fe618ccbb58 @x=1, @y=2>, #<Crossword::Cell:0x007fe618ccbb30 @x=1, @y=3>, #<Crossword::Cell:0x007fe618ccbb08 @x=2, @y=0>, #<Crossword::Cell:0x007fe618ccbae0 @x=2, @y=1>, #<Crossword::Cell:0x007fe618ccbab8 @x=2, @y=2>, #<Crossword::Cell:0x007fe618ccba90 @x=2, @y=3>, #<Crossword::Cell:0x007fe618ccba68 @x=3, @y=0>, #<Crossword::Cell:0x007fe618ccba40 @x=3, @y=1>, #<Crossword::Cell:0x007fe618ccba18 @x=3, @y=2>, #<Crossword::Cell:0x007fe618ccb9f0 @x=3, @y=3>]>, @word_list=#<Crossword::WordList:0x007fe618ccb9c8 @words=["BEER", "RAVE", "ASIA", "YELL", "BRAY", "EASE", "EVIL", "REAL"]>>
2.0.0p247 :003 > puzzle.build!
nil
2.0.0p247 :004 > puzzle.print
B R A Y
E A S E
E V I L
R E A L
nil
```
