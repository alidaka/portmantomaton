require "minitest/autorun"
require_relative "../word"

class WordTest < Minitest::Test
  def test_constructor
    word = Word.new("AUTOMATON  AO0 T AA1 M AH0 T AA2 N")

    assert_equal "AUTOMATON", word.word
    assert_equal ["AO0", "T", "AA1", "M", "AH0", "T", "AA2", "N"], word.phones
  end
end
