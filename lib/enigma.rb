require 'date'
require './lib/encrypter'
require './lib/decrypter'

class Enigma

  def initialize
  end

  def encrypt(message, key = [*"00001".."99999"].sample, date = Date.today)
    encrypter = Encrypter.new(message, key, date)
    new_text = encrypter.letter_encryption(message.downcase.chomp)
    {encryption: new_text, key: key, date: date}
  end

  def decrypt(encryption, key, date = Date.today)
    decrypter = Decrypter.new(encryption, key, date)
    new_text = decrypter.letter_decryption(encryption.downcase.chomp)
    {decryption: new_text, key: key, date: date}
  end


end
