require_relative "word_from_number"
require "test/unit"

class TestNumberToWord < Test::Unit::TestCase

  def test_numbers_to_words
    assert_equal(7, WordFromNumberConversion.new().number_to_letters("6686787825").length )
    assert_equal(8, WordFromNumberConversion.new().number_to_letters("2282668687").length )
  end

  def test_for_values_to_be_same
    assert_equal(["noun", "struck"], WordFromNumberConversion.new().number_to_letters("6686787825").first)
  end

end