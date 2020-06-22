def caesar_cipher(message = "Hello Wordl!",shift_numb = 1)
	crypted_message = []
	message.each_byte do |char|
		crypted_message.push char_shifting(char,shift_numb)
	end
	return crypted_message.join
end

def char_shifting(ascii = 0, shift = 1)
	shift_sign = shift <=> 0
	if ascii >= 65 && ascii <= 90
		i = 0
		while i < shift.abs do
			ascii += shift_sign
			ascii = ascii > 90 ? 65 : ascii
			ascii = ascii < 65 ? 90 : ascii
			i += 1
		end
	elsif ascii >= 97 && ascii <= 122
		i = 0
			while i < shift.abs do
			ascii += shift_sign
			ascii = ascii > 122 ? 97 : ascii
			ascii = ascii < 97 ? 122 : ascii
			i += 1
		end
	end
	return ascii.chr
end

puts caesar_cipher("What a string!", 5)