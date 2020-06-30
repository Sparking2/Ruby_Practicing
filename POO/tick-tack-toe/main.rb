
require_relative "board_drawer.rb"
require_relative "ruler.rb"
require_relative "player.rb"
require 'matrix'


include BoardDrawer
include RuleChecker

m = Matrix[
    [" "," "," "],
    [" "," "," "],
    [" "," "," "]
]

#@param input[String]
def player_input(input,m,player_playing)
    position = input.to_i
    player_symbol = player_playing == 1 ? "X" : "O"
    case position
    when 1
        if m[2,0] != " "
            p "don't be a bad player, spot already taken"
        else
            m[2,0] = player_symbol
        end
    when 2
        if m[2,1] != " "
            p "don't be a bad player, spot already taken"
        else
            m[2,1] = player_symbol
        end
    when 3
        if m[2,2] != " "
            p "don't be a bad player, spot already taken"
        else
            m[2,2] = player_symbol
        end
    when 4
        if m[1,0] != " "
            p "don't be a bad player, spot already taken"
        else
            m[1,0] = player_symbol
        end
    when 5
        if m[1,1] != " "
            p "don't be a bad player, spot already taken"
        else
            m[1,1] = player_symbol
        end
    when 6
        if m[1,2] != " "
            p "don't be a bad player, spot already taken"
        else
            m[1,2] = player_symbol
        end
    when 7
        if m[0,0] != " "
            p "don't be a bad player, spot already taken"
        else
            m[0,0] = player_symbol
        end
    when 8
        if m[0,1] != " "
            p "don't be a bad player, spot already taken"
        else
            m[0,1] = player_symbol
        end
    when 9
        if m[0,2] != " "
            p "don't be a bad player, spot already taken"
        else
            m[0,2] = player_symbol
        end
    else
        puts "Wrong input, use number 1-9"
    end

end

current_player = 0

until is_game_over?(m)
    current_player = current_player == 1 ? 2 : 1
    draw_board(m)
    selection = gets.chomp
    player_input(selection,m,current_player)
    system "clear"
end

draw_board(m)
winner = current_player == 1 ? "X" : "O"
puts "player #{winner} won"

