module BoardDrawer

    #@param board_matrix[Matrix]
    def draw_board(board_matrix)
        top_row = board_matrix.row(0)
        middle_row = board_matrix.row(1)
        bottom_row = board_matrix.row(2)

        puts "      |     |    "
        puts "   #{top_row[0]}  |  #{top_row[1]}  |  #{top_row[2]}  "
        puts "  ----|-----|----"
        puts "      |     |    "
        puts "   #{middle_row[0]}  |  #{middle_row[1]}  |  #{middle_row[2]}  "
        puts "  ----|-----|----"
        puts "      |     |    "
        puts "   #{bottom_row[0]}  |  #{bottom_row[1]}  |  #{bottom_row[2]}  "
        puts "      |     |    "
    end

end