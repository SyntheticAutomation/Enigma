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
  end

  def test_decrypt_returns_all_three_arguments_correctly
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, actual
  end


end
