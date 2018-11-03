require './test/test_helper.rb'
require 'date'
require './lib/enigma'



class EncrypterTest < Minitest::Test

  def test_it_exists
    encrypter = Encrypter.new
    assert_instance_of Encrypter, encrypter
  end

  def test_it_encrypts_despite_one_argument
    encrypter = Encrypter.new
    actual = encrypter.letter_encryption("hello world")
    refute_equal "hello world", actual
  end


end
