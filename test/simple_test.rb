require "minitest/autorun"
require_relative "../simple"

class SimpleTest < Minitest::Test
  def test_parser
    assert_equal 134373, parse_cmu().length
  end
end
