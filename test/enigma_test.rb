require './test/test_helper.rb'
require 'date'
require './lib/enigma'



class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @my_message = "hello world"
    @output = @enigma.encrypt(@my_message, "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_creates_keys
    assert_equal ["02", "27", "71", "15"], @enigma.create_keys
  end

  def test_it_creates_offsets
    assert_equal [1, 0, 2, 5], @enigma.create_offsets
  end

  def test_it_returns_final_shift
    assert_equal [3, 27, 73, 20], @enigma.final_shift
  end

  def test_encrypt_returns_all_three_arguments_correctly
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @output
  end

  def test_it_assigns_date_despite_one_argument
    actual = @enigma.encrypt("hello world")[:date]
    expected = @enigma.date
    assert_equal expected, actual
  end

  def test_it_encrypts_despite_one_argument
    e = Enigma.new
    e.encrypt("hello world")
    refute_equal "hello world", e.encrypted_message
    refute_nil e.date
  end

  def test_encrypt_skips_and_still_returns_foreign_characters
    e = Enigma.new
    e.encrypt("!!_@")
    assert e.encrypted_message.include?("!!_@")
  end

  # def test_it_decrypt_returns_all_three_arguments_correctly
  #   e = Enigma.new
  #   actual = e.decrypt("keder ohulw", "02715", "040895")
  #   expected =


end
