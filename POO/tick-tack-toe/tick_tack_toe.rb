module GameChecker
    #@param elements[Array]
    def all_equal?(*elements)
        return elements.all? {|x| x == elements.last }
    end
end


class GameManager
    
    include GameChecker

    def initialize
        @board_matrix = {:top_left => " ", :top_center => " ", :top_right => " ", :middle_left => " ", :middle_center => " ", :middle_right => " ", :bottom_left => " ", :bottom_center => " ", :bottom_right => " "}
        @game_over = false
        @current_player = 1
        @round = 0
    end

    def is_game_over?
        return @game_over
    end


    public
    attr_reader :current_player
    attr_reader :winner

    def print_board
        puts "     |   |   "
        puts "   #{@board_matrix[:top_left]} | #{@board_matrix[:top_center]} | #{@board_matrix[:top_right]} "
        puts "  ___|___|___"
        puts "     |   |   "
        puts "   #{@board_matrix[:middle_left]} | #{@board_matrix[:middle_center]} | #{@board_matrix[:middle_right]} "
        puts "  ___|___|___"
        puts "     |   |   "
        puts "   #{@board_matrix[:bottom_left]} | #{@board_matrix[:bottom_center]} | #{@board_matrix[:bottom_right]} "
        puts "     |   |   "
    end

    #@param input[String]
    def players_input(input)
        position = input.to_i
        mark = current_player == 1 ? "X" : "O"
        case position
            when 1
                @board_matrix[:bottom_left] = mark
            when 2
                @board_matrix[:bottom_center] = mark
            when 3
                @board_matrix[:bottom_right] = mark
            when 4
                @board_matrix[:middle_left] = mark
            when 5
                @board_matrix[:middle_center] = mark
            when 6
                @board_matrix[:middle_right] = mark
            when 7
                @board_matrix[:top_left] = mark
            when 8
                @board_matrix[:top_center] = mark
            when 9
                @board_matrix[:top_right] = mark
            else
                puts "Error, invalid number, is only valid from 1 - 9, each number corresponding to a slot in the board like:"
                puts "7|8|9"
                puts "_____"
                puts "4|5|6"
                puts "_____"
                puts "1|2|3"
        end
        check_game
    end

    private
    #@param @board_matrix[Hash]
    attr_accessor :board_matrix
    attr_accessor :game_over
    attr_writer :current_player
    @board_matrix
    @game_over
    @current_player
    @winner

    def check_game
        
        if all_equal?(@board_matrix[:top_left], @board_matrix[:top_center], @board_matrix[:top_right]) && @board_matrix[:top_right] != " "
            @game_over = true
            @winner = @current_player
        elsif all_equal?(@board_matrix[:middle_left],@board_matrix[:middle_center],@board_matrix[:middle_right]) && @board_matrix[:middle_right] != " "
            @game_over = true
            @winner = @current_player
        elsif all_equal?(@board_matrix[:bottom_left],@board_matrix[:bottom_center],@board_matrix[:bottom_right]) && @board_matrix[:bottom_right] != " "
            @game_over = true
            @winner = @current_player
        elsif all_equal?(@board_matrix[:top_left],@board_matrix[:middle_left],@board_matrix[:bottom_left]) && @board_matrix[:bottom_left] != " "
            @game_over = true
            @winner = @current_player
        elsif all_equal?(@board_matrix[:top_center],@board_matrix[:middle_center],@board_matrix[:bottom_center]) && @board_matrix[:bottom_center] != " "
            @game_over = true
            @winner = @current_player
        elsif all_equal?(@board_matrix[:top_right],@board_matrix[:middle_center],@board_matrix[:bottom_right]) && @board_matrix[:bottom_right] != " "
            @game_over = true
            @winner = @current_player
        elsif all_equal?(@board_matrix[:top_left],@board_matrix[:middle_center],@board_matrix[:bottom_right]) && @board_matrix[:bottom_right] != " "
            @game_over = true
            @winner = @current_player
        elsif all_equal?(@board_matrix[:top_right],@board_matrix[:middle_center],@board_matrix[:bottom_left]) && @board_matrix[:bottom_left] != " "
            @game_over = true
            @winner = @current_player
        elsif @round > 9
            @game_over = true
        end

        unless @game_over
            @current_player = current_player == 1 ? 2 : 1
        end

        @round = @round + 1
    end

end

game_manager = GameManager.new();

#system "clear"
until game_manager.is_game_over?
    puts " |*** Tick Tack Toe - player #{game_manager.current_player} turn ***|"
    selection = gets.chomp
    game_manager.players_input(selection)
    system "clear"
    game_manager.print_board
end

puts "the winner is player #{game_manager.winner}"

