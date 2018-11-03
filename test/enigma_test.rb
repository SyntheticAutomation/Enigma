require './test/test_helper.rb'
require 'date'
require './lib/enigma'



class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_creates_keys
    @enigma.encrypt("hello world", "02715", "040895")
    assert_equal ["02", "27", "71", "15"], @enigma.create_keys
  end

  def test_it_creates_offsets
    @enigma.encrypt("hello world", "02715", "040895")
    assert_equal [1, 0, 2, 5], @enigma.create_offsets
  end

  def test_it_returns_final_shift
    @enigma.encrypt("hello world", "02715", "040895")
    assert_equal [3, 27, 73, 20], @enigma.final_shift
  end

  def test_encrypt_returns_all_three_arguments_correctly
    output = @enigma.encrypt("hello world", "02715", "040895")
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, output
  end

  def test_it_assigns_date_despite_one_argument
    actual = @enigma.encrypt("hello world")[:date]
    expected = @enigma.date
    assert_equal expected, actual
  end

  def test_it_encrypts_despite_one_argument
    @enigma.encrypt("hello world")
    refute_equal "hello world", @enigma.encrypted_message
    refute_nil @enigma.date
  end

  def test_encrypt_skips_and_still_returns_foreign_characters
    @enigma.encrypt("!!_@")
    assert @enigma.encrypted_message.include?("!!_@")
  end

  def test_it_decrypt_returns_all_three_arguments_correctly
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {encryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, actual
  end

  def test_decrypt_skips_and_still_returns_foreign_characters
    @enigma.decrypt("!!_@", "02715", "040895")
    assert @enigma.decrypted_message.include?("!!_@")
  end
end
