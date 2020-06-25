dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#@param word [String]
#@param dictionary_array [Array]
def substrings(word="string",dictionary_array = [])
    
    counter = Hash.new 0

    word_array = word.downcase.split(" ")

    dictionary_array.each do |current_dictionary_word| 
        word_array.each do |current_phrase_word|
            if current_phrase_word.include? current_dictionary_word
                counter[current_dictionary_word] += 1
            end
        end
    end
    return counter
end

p substrings("Howdy partner, sit down! How's it going?", dictionary)