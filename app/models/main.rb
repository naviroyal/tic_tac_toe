require_relative "grid"
require_relative "user"

class Main
    puts "Enter the size of grid no of rows and cols"
    row = gets.chomp().to_i
    col = gets.chomp().to_i

    puts "Enter number of players"
    no_of_players = gets.chomp().to_i
    max_moves = (row*col)
    curr_moves = 0
    players = []
    (1..no_of_players).each do |player_no|
        puts "Enter player #{player_no} name"
        name = gets.chomp()
        puts "Enter the sign with which player #{player_no} play"
        sign = gets.chomp()

        player = User.new(player_no,name,sign)
        players << player
    end

    grid = Grid.new(row,col,players)
    player_turn = 0
    while(!grid.is_game_completed)
        player_turn = player_turn % no_of_players
        puts "Player #{grid.players[player_turn].name} enter your move"
        row_no = gets.chomp().to_i
        col_no = gets.chomp().to_i
        if grid.is_valid_move(row_no,col_no)
            grid.game_board[row_no][col_no] = grid.players[player_turn].sign
            if grid.has_player_won(grid.players[player_turn])
                puts "Player #{grid.players[player_turn].name} has won the game"
                break
            end
            player_turn = player_turn + 1
            curr_moves = curr_moves + 1
        elsif max_moves == curr_moves
            grid.is_game_completed = true
            puts "No One wins the game"
        else
            puts "Invalid Move"
        end
        grid.print_grid()
    end
end