require 'minitest/autorun'
require 'date'
require 'minitest/pride'
require './lib/enigma'



class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
    @my_message = "this is so secret ..end.."
    @output = @e.encrypt(@my_message, "12345", Date.today)
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_creates_keys
    assert_equal [12, 23, 34, 45], @e.distribute_keys
  end

  def test_it_creates_offsets
    assert_equal [9, 9, 2, 4], @e.create_offsets
  end

  def test_it_returns_final_shift
    assert_equal [21, 32, 36, 49], @e.final_shift
  end

  def test_it_encrypts_characters
    expected = ["n", "b", "c", "m", "u", "c", "m", "u", "m", "i", "u", "m", "z", "x", "l", "z", "n", "u", ".", ".", "z", "h", "y", ".", "."]
    assert_equal expected, @e.letter_encryption(@my_message)
  end

end
