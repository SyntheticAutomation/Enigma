require './lib/algorithm'

class Encrypter
  include Algorithm

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = (date == Date.today) ? (date.strftime("%d%m%y")) : date
    @encrypted_message = ""
  end

  def letter_encryption(message)
    set = ("a".."z").to_a << " "
    rotations = 0
    message.chars.each do |character|
      recognized = set.include?(character)
      index = set.index(character)
      rotated_shifts = final_shift.rotate(rotations)
      if recognized
        @encrypted_message << (set.rotate(rotated_shifts[0])[index])
        rotations += 1
      else
        @encrypted_message << character
      end
    end
    @encrypted_message
  end



end
