require_relative './code_generator.rb'


puts "Welcome to mastermind"
puts "Game modes:"
puts "1 - Random Guess"
puts "2 - Pick guess"
selection = gets.chomp

if selection.to_i == 1 
    game_code = Code.new(selection,"")
else
    puts "write the code, available colors R-G-B-Y"
    player_code = gets.chomp
    game_code = Code.new(selection,player_code)
end

(1..12).each do |_i|
    puts "Possible available guess R,G,B,Y"
    player_guess = gets.chomp
    feedback = game_code.check_code(player_guess)
    p feedback
    if feedback.all?("✔")
        break
    end
end

puts "The correct answer is #{game_code.answer_is}"
