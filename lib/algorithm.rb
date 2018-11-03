module Algorithm

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
    create_keys
    create_offsets
    keys_as_integers = create_keys.map {|key| key.to_i}
    keys_and_offsets = [keys_as_integers, create_offsets]
    keys_and_offsets.transpose.map {|pair| pair.sum}
  end



end
