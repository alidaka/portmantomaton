require "minitest/autorun"
require_relative "../simple"

class SimpleTest < Minitest::Test
  def test_parser
    assert_equal 134373, parse_cmu().length
  end

  def test_smashable?
    word1 = Word.new("BLOW  B L OW1")
    word2 = Word.new("OFILIA  OW0 F IY1 L IY0 AH0")
    assert smashable?(word1, word2)
  end
end
