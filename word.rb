class Word
  attr_reader :word, :phones

  def initialize(line)
    tokens = line.split
    @word = tokens.shift
    @phones = tokens
  end
end
