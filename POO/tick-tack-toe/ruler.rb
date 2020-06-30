module RuleChecker
    #@param board_matrix[Matrix]
    def is_game_over?(board_matrix)
        is_over = false

        #check horizontal top
        top_row = []
        board_matrix.row(0){ |val| top_row.push(val)}
        is_over = is_over == true ? is_over : is_over = top_row.all? { |val| val != " " && val == top_row[0]}

        #check horizontal middle
        middle_row = []
        board_matrix.row(1){ |val| middle_row.push(val)}
        is_over = is_over == true ? is_over : middle_row.all? { |val| val != " " && val == middle_row[0]}

        #check horizontal bottom
        bottom_row = []
        board_matrix.row(2){ |val| bottom_row.push(val)}
        is_over = is_over == true ? is_over : is_over = bottom_row.all? { |val| val != " " && val == bottom_row[0]}

        #check vertical left
        left_column = []
        board_matrix.column(0){ |val| left_column.push(val)}
        is_over = is_over == true ? is_over : is_over = left_column.all? { |val| val != " " && val == left_column[0]}

        #check vertical center
        middle_column = []
        board_matrix.column(0){ |val| middle_column.push(val)}
        is_over = is_over == true ? is_over : is_over = middle_column.all? { |val| val != " " && val == middle_column[0]}

        #check vertical right
        right_column = []
        board_matrix.column(0){ |val| right_column.push(val)}
        is_over = is_over == true ? is_over : is_over = right_column.all? { |val| val != " " && val == right_column[0]}

        #check left diagonal
        left_diagonal = []
        left_diagonal.push(top_row[0])
        left_diagonal.push(middle_row[1])
        left_diagonal.push(bottom_row[2])
        is_over = is_over == true ? is_over : is_over = left_diagonal.all? { |val| val != " " && val == left_diagonal[0]}

        #check right diagonal
        right_diagonal = []
        right_diagonal.push(top_row[2])
        right_diagonal.push(middle_row[1])
        right_diagonal.push(bottom_row[0])
        is_over = is_over == true ? is_over : is_over = right_diagonal.all? { |val| val != " " && val == right_diagonal[0]}

        #the board is full?
       if board_matrix.all? { |val| val != " " }
            is_over = is_over == true ? is_over : is_over = true
       end

       return is_over
    end
end