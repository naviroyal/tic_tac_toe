class Grid
    attr_accessor :row, :col, :game_board, :players,:is_game_completed

    def initialize(row,col,players)
        @row = row
        @col = col
        @players = players
        @is_game_completed = false
        @game_board = Array.new(row) { Array.new(col) {'-'}}
    end

    def has_player_won(player)
        sign = player.sign
        for i in (0..@row-1)
            for j in (0..@col-1)
                if @game_board[i][j] == sign && is_valid_move(i,j)
                    if(is_valid_move(i-1,j) && is_valid_move(i+1,j) && @game_board[i-1][j]==sign && @game_board[i+1][j]==sign) || 
                       (is_valid_move(i-1,j-1) && is_valid_move(i+1,j+1) && @game_board[i-1][j-1]==sign && @game_board[i+1][j+1]==sign) ||
                       (is_valid_move(i-1,j+1) && is_valid_move(i+1,j-1) && @game_board[i-1][j+1]==sign && @game_board[i+1][j-1]==sign) ||
                       (is_valid_move(i,j+1) && is_valid_move(i,j-1) && @game_board[i][j-1]==sign && @game_board[i][j+1]==sign ) 
                       @is_game_completed = true
                       return true
                    end
                end
            end
        end
        return false
    end

    def is_valid_move(row,col)
        row >= 0 && col >= 0 && row < @row && col < @col
    end

    def print_grid()
        for i in (0..@row-1)
            for j in (0..@col-1)
                print "#{@game_board[i][j]} " 
            end
            puts ""
        end
    end
end