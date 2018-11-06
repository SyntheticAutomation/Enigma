require './test/test_helper.rb'
require 'date'
require './lib/enigma'
require './lib/encrypter'
require './lib/decrypter'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_returns_all_three_arguments_correctly
    output = @enigma.encrypt("hello world", "02715", "040895")
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, output
    actual = @enigma.encrypt("HELLO WORLD", "02715", "040895")
    assert_equal expected, actual
    new_cipher = @enigma.encrypt("The money is safe", "12345", "031118")
    new_result = {encryption: "nmnvgtw sernuxjaz", key: "12345", date: "031118"}
    assert_equal new_result, new_cipher
  end

  def test_it_still_encrypts_without_date
    e = Enigma.new
    actual = e.encrypt("hello world", "02715")
    expected = Date.today.strftime("%d%m%y")
    assert_equal expected, actual[:date]
  end

  def test_decrypt_returns_all_three_arguments_correctly
    output = @enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, output
    actual = @enigma.decrypt("KEdEr OhULW", "02715", "040895")
    assert_equal expected, actual
    new_cipher = @enigma.decrypt("nmnvgtw sernuxjaz", "12345", "031118")
    new_result = {decryption: "the money is safe", key: "12345", date: "031118"}
    assert_equal new_result, new_cipher
  end

end
