require 'date'

class Enigma


  def initialize
    @key = ""
    @date = ""
    @rotations = 0
    @encrypted_message = ""
    @set = ("a".."z").to_a << " "
  end

  def encrypt(message_string, key = nil, date = nil)
    @key << key
    if date == nil
      date = Date.today
      formatted_date = date.strftime("%d%m%y")
      @date << formatted_date
    else
      @date << date
    end
    create_keys
    create_offsets
    final_shift
    {encryption: letter_encryption(message_string), key: key, date: @date}
  end

  def create_keys
    a = @key.chars[0] + @key.chars[1]
    b = @key.chars[1] + @key.chars[2]
    c = @key.chars[2] + @key.chars[3]
    d = @key.chars[3] + @key.chars[4]
    [a, b, c, d]
  end

  def create_offsets
    numeric_square = (@date.to_i ** 2).to_s
    last_four = numeric_square[-4..-1]
    a = last_four[0].to_i
    b = last_four[1].to_i
    c = last_four[2].to_i
    d = last_four[3].to_i
    [a, b, c, d]
  end

  def final_shift
    keys_as_integers = create_keys.map {|key| key.to_i}
    keys_and_offsets = [keys_as_integers, create_offsets]
    keys_and_offsets.transpose.map {|pair| pair.sum}
  end

  def rotate_once
    @rotations += 1
  end

  def letter_encryption(message_string)
    message_string.chars.map do |character|
      recognized = @set.include?(character)
      location = @set.index(character)
      rotated_shifts = final_shift.rotate(@rotations)
      if recognized && rotated_shifts.first < 27
        rotate_once
        index = location + rotated_shifts.first
        new_letter = @set[index] if index < 27
        new_letter = @set[index-27] if index > 27
        @encrypted_message << new_letter
      elsif recognized && rotated_shifts.first > 27
        rotate_once
        @encrypted_message << @set[location - (27 - (rotated_shifts.first % 27))]
      elsif recognized && rotated_shifts.first == 27
        rotate_once
        @encrypted_message << @set[location]
      else
        @encrypted_message << character
      end
    end
    @encrypted_message
  end



end
