require 'date'

class Enigma


  def initialize
    @key = ""
    @date = ""
  end

  def encrypt(message_string, key = nil, date = Date.today)
    @key << key
    formatted_date = date.strftime("%d%m%y")
    @date << formatted_date
    # letter_encryption(message_string)
    #returns {:encryption => x, :key => key, :date => formatted_date}
  end

  def distribute_keys
    a = (@key.chars[0] + @key.chars[1]).to_i
    b = (@key.chars[1] + @key.chars[2]).to_i
    c = (@key.chars[2] + @key.chars[3]).to_i
    d = (@key.chars[3] + @key.chars[4]).to_i
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
    distribute_keys
    create_offsets
    keys_and_offsets = [distribute_keys, create_offsets]
    shift_array = keys_and_offsets.transpose.map {|pair| pair.sum}
    collection = {}
    collection[:A] = shift_array[0]
    collection[:B] = shift_array[1]
    collection[:C] = shift_array[2]
    collection[:D] = shift_array[3]
    collection
  end

  # def letter_encryption(message_string)
  #   final_shift
  #   character_set = ("a".."z").to_a << " "
  #   #["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  #   expanded_message_array = message_string.chars
  #   expanded_message_array.map do |character|
  #     if character_set.include?(character)
  #       loop do
  #       final_shift.map do |num|
  #
  #         character_set.index(character)
  #       end
  #     end
  #   end
  #   #["t", "h", "i", "s", " ", "i", "s", " ", "s", "o", " ", "s", "e", "c", "r", "e", "t", " ", ".", ".", "e", "n", "d", ".", "."]
  # end















end
