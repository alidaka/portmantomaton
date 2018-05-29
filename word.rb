class Word
  attr_reader :word, :phones, :stressed_phones

  def initialize(line)
    tokens = line.split
    @word = tokens.shift
    @stressed_phones = tokens
    @phones = Word.remove_stresses(@stressed_phones)
  end

  def to_s
    "#{@word}: #{@phones}"
  end

  def last_stress
    count = @stressed_phones.rindex(&/\d/.method(:=~))
    @phones[count..@phones.length]
  end

  def first_stress
    count = @stressed_phones.index(&/\d/.method(:=~))
    @phones[0..count]
  end

  def matches_in(words)
    matches = words.select{ |w| last_stress == w.first_stress }
  end

  def ==(other)
    (@word == other.word) && (@stressed_phones == other.stressed_phones)
  end

  private

  def self.remove_stresses(phones)
    phones.map{ |phone| phone.sub(/\d/, "") }
  end
end
