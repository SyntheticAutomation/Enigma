require_relative '../lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
message = handle.read
handle.close
decrypted_text = enigma.decrypt(message, ARGV[2].to_s, ARGV[3].to_s)
writer = File.open(ARGV[1], "w")
writer.write(decrypted_text[:decryption])
writer.close
puts "Created '#{ARGV[1]}' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"
