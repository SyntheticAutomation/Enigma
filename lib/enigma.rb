require 'date'
require './lib/encrypter'
require './lib/decrypter'

class Enigma

  def initialize
    @date_string = Date.today.strftime("%d%m%y")
  end

  def encrypt(message, key = [*"00001".."99999"].sample, date = @date_string)
    encrypter = Encrypter.new(message, key, date)
    new_text = encrypter.letter_encryption(message.downcase.chomp)
    {encryption: new_text, key: key, date: date}
  end

  def decrypt(encryption, key, date = @date_string)
    decrypter = Decrypter.new(encryption, key, date)
    new_text = decrypter.letter_decryption(encryption.downcase.chomp) if encryption.class == String
    new_text = decrypter.letter_decryption(encryption[:encryption].downcase.chomp) if encryption.class == Hash
    {decryption: new_text, key: key, date: date}
  end
end
