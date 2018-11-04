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
    encryption.chars.each do |character|
      recognized = set.include?(character)
      index = set.index(character)
      rotated_shifts = final_shift.rotate(rotations)
      (@decrypted_message << (set.rotate(-1 * rotated_shifts[0])[index]); rotations += 1) if recognized
      (@decrypted_message << character) unless recognized
    end
      @decrypted_message
  end
end
