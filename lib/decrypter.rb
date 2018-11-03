require './lib/algorithm'

class Decrypter
  include Algorithm

  attr_reader :encryption, :key, :date, :decrypted_message

  def initialize(encryption, key, date)
    @encryption = encryption
    @key = key
    @date = (date == Date.today) ? (date.strftime("%d%m%y")) : date
    @decrypted_message = ""
  end

  def letter_decryption(encryption)
    set = ("a".."z").to_a << " "
    rotations = 0
    encryption.class == String ? characters_array = encryption.chars : characters_array = encryption[:encryption].chars
    characters_array.each do |character|
      recognized = set.include?(character)
      index = set.index(character)
      rotated_shifts = final_shift.rotate(rotations)
      if recognized
      @decrypted_message << (set.rotate(-1 * rotated_shifts[0])[index])
        rotations += 1
      else
        @decrypted_message << character
      end
    end
      @decrypted_message
  end

end
