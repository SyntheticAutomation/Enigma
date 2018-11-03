require_relative '../lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
message = handle.read
handle.close
encrypted_text = enigma.encrypt(message)
writer = File.open(ARGV[1], "w")
writer.write(encrypted_text[:encryption])
writer.close
puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
