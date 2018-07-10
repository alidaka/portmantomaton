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

def matches_for_inverse(word, words)
  words.select{ |w| w.last_stress == word.first_stress }
end

def matches_for(word, words)
  words.select{ |w| word.last_stress == w.first_stress }
end

def lookup(word, words)
  words.find{ |w| w.word == word}
end

def run
  words = parse_cmu

  matches = nil
  candidate = words.shuffle.find{ |candidate|
    matches = matches_for(candidate, words)
    matches.any?
  }

  puts candidate
  puts matches.sample
end

run
