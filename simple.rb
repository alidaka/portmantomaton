require_relative "word"

def parse_cmu()
  File.read("cmudict-0.7b")
    .split("\n")
    .drop_while{ |line| line.start_with?(";") }
    .map(&:strip)
    .map{ |line| Word.new(line) }
end

puts parse_cmu.length