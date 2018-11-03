require './test/test_helper.rb'
require 'date'
require './lib/enigma'



class EncrypterTest < Minitest::Test

  def test_it_exists
    encrypter = Encrypter.new
    assert_instance_of Encrypter, encrypter
  end


end
