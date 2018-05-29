require_relative "word"

def parse_cmu()
  File.read("cmudict-0.7b")
    .split("\n")
    .drop_while{ |line| line.start_with?(";") }
    .map(&:strip)
    .map{ |line| Word.new(line) }
end

def smashable?(first, second)
  first.last_stress == second.first_stress
end

def matches_for(word, words)
  matches = words.select{ |w| word.last_stress == w.first_stress }
end

def run()
  words = parse_cmu

  matches = nil
  word = words.shuffle.find{ |word|
    matches = matches_for(word, words)
    matches.any?
  }

  puts word
  puts matches.sample
end

run
