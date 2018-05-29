require "minitest/autorun"
require_relative "../word"

class WordTest < Minitest::Test
  def test_constructor
    word = Word.new("AUTOMATON  AO0 T AA1 M AH0 T AA2 N")

    assert_equal "AUTOMATON", word.word
    assert_equal ["AO", "T", "AA", "M", "AH", "T", "AA", "N"], word.phones
  end

  def test_last_stress
    word = Word.new("AUTOMATON  AO0 T AA1 M AH0 T AA2 N")
    assert_equal ["AA", "N"], word.last_stress
  end

  def test_first_stress
    word = Word.new("AUTOMATON  AO0 T AA1 M AH0 T AA2 N")
    assert_equal ["AO"], word.first_stress
  end

  def test_matches_in
    word = Word.new("MONSTER  M AA1 N S T ER0")
    dict = [
      Word.new("EAGLE  IY1 G AH0 L"),
      Word.new("EARL  ER1 L"),
      Word.new("EARLEY  ER1 L IY0"),
      Word.new("EARMARK  IH1 R M AA2 R K")
    ]

    expected = [
      Word.new("EARL  ER1 L"),
      Word.new("EARLEY  ER1 L IY0")
    ]

    assert_equal expected, word.matches_in(dict)
  end
end
