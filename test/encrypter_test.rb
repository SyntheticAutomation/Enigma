require './test/test_helper.rb'
require 'date'
require './lib/enigma'



class EncrypterTest < Minitest::Test

  def setup
    @encrypter = Encrypter.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encrypter, @encrypter
  end

  def test_it_has_message
    assert_equal "hello world", @encrypter.message
  end

  def test_it_has_key
    assert_equal "02715", @encrypter.key
  end

  def test_it_has_date
    assert_equal "040895", @encrypter.date
  end

  def test_it_creates_keys
    assert_equal ["02", "27", "71", "15"], @encrypter.create_keys
  end

  def test_it_creates_offsets
    assert_equal [1, 0, 2, 5], @encrypter.create_offsets
  end

  def test_it_returns_final_shift
    assert_equal [3, 27, 73, 20], @encrypter.final_shift
  end

  def test_it_encrypts_despite_one_argument
    enigma = Enigma.new
    actual = enigma.encrypt("hello world")
    refute_equal "hello world", actual
  end

  def test_encrypt_skips_and_still_returns_foreign_characters
    e = Enigma.new
    actual = e.encrypt("!!_@", "02715", "040895")[:encryption]
    assert_equal "!!_@", actual
  end
end
