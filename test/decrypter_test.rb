require './test/test_helper.rb'
require 'date'
require './lib/decrypter'
require './lib/enigma'


class DecrypterTest < Minitest::Test

  def setup
    @decrypter = Decrypter.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Decrypter, @decrypter
  end

  def test_it_has_encryption
    assert_equal "keder ohulw", @decrypter.encryption
  end

  def test_it_has_key
    assert_equal "02715", @decrypter.key
  end

  def test_it_has_date
    assert_equal "040895", @decrypter.date
  end

  def test_it_creates_keys
    assert_equal ["02", "27", "71", "15"], @decrypter.create_keys
  end

  def test_it_creates_offsets
    assert_equal [1, 0, 2, 5], @decrypter.create_offsets
  end

  def test_it_returns_final_shift
    assert_equal [3, 27, 73, 20], @decrypter.final_shift
  end

  def test_decrypt_skips_and_still_returns_foreign_characters
    e = Enigma.new
    actual = e.decrypt("!!_@", "02715", "040895")[:decryption]
    assert_equal "!!_@", actual
  end


end
