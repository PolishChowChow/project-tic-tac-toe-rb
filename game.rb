# module for managing instructions
module Controller

    # declared instructions
    INSTRUCTIONS = 
        [
            {"type" => "normal", "value"  => "Rules are pretty long so just press any button to forward to the next rule, click any button to continue."},
            {"type" => "normal", "value"  => "Tic tac toe is a game on 2D 3x3 board, when you as 2 players can place O and X on the board. Example on the next slide:"},
            {"type" => "board", "value" => ["1","2","3","4","5","6","7","8","9"]},
            {"type" => "normal", "value"  => "O allways starts the game, when O is placed it is turn for X etc."},
            {"type" => "board", "value" => ["O","","","","","","","",""]},
            {"type" => "board", "value" => ["O","X","","","","","","",""]},
            {"type" => "board", "value" => ["O","X","O","","","","","",""]},
            {"type" => "normal", "value"  => "If someone gets 3 line in a row (vertical, horizontal or diagonally) wins the game:"},
            {"type" => "board", "value" => ["X","X","X","","","","","",""]},
            {"type" => "board", "value" => ["X","","","X","","","X","",""]},
            {"type" => "board", "value" => ["X","","","","X","","","","X"]},
            {"type" => "normal", "value"  => "If nobody will be able to achieve this, it ends up with a draw"},
            {"type" => "board", "value" => ["O","X","O","O","X","O","X","O","X"]},
            {"type" => "normal", "value" => "And that's all"},
    ]

    # printing one step with "stopping" and going next on button press
    def self.step_print(content)
        puts content
        var = gets.chomp
    end

    # method returning instructions
    def self.get_instructions
        return INSTRUCTIONS
    end
end

# class for managing board printing
class Printer

    # prints board using the "shape" functions bellow in this class
    def board(arr)
        puts LINE
        for i in 0..arr.length-1
            if(arr[i] == "")
                print_one_value(" ")
            elsif
                print_one_value(arr[i])
            end
            if (i+1)%3 == 0
                print_new_line
            end
        end
    end

    # everything with designed shape of printing (private, cause it's needed only in this class)
    private
    LINE = "-------"
    def print_new_line
        print "|"
        puts ""
        puts LINE
    end
    def print_one_value(value)
        print "|#{value}"
    end
end

# class for manipulating board itself
class BoardManager
    @board

    # setting default board to contain 9 empty strings
    def initialize
        @board = ["","","","","","","","",""]
    end
    
    # pushing sign only if the board with provided index is empty + little validation
    def push_sign(sign, index)
        if !(index in 0..8)
            puts "bad index, index has to be greater than 1 and smaller than 9"
        elsif @board[index] !=""
            puts "this place is already taken"
        elsif
            @board[index] = sign
            return true
        end
        return false
    end

    # getter for board
    def get_board
        return @board
    end
end

# class for creating game 
class GameManager
    private

    # including tutorial controller
    include Controller

    # Printer controller for managing printing the board
    PRINT = Printer.new

    # answers considered as confirmation
    CONFIRMATIONS = ["yes", "yeah", "sure", "why not"]

    # starting game on object creations
    def initialize
        play_game
    end

    # managing functions bellow in order to play game or quit if user wants to
    def play_game
        intro
        reset_to_basic
        while @winner == false
            play_round
            if @turns == 9
                break;
            end
        end
        show_board
        if @winner
            puts "#{@sign} is the winner!"
        elsif
            puts "DRAW!"
        end
        puts "Would you like to play next game?"
        choice = gets.chomp
        if CONFIRMATIONS.include?(choice)
            play_game
        elsif
            puts "Bye!!"
        end
    end

    # plays one round, takes input from the user (index of square he wants to insert his sign) and checking is someone winner by invoking is_winner function
    def play_round
        end_round = false
        while end_round == false
            puts "It's #{@sign}'s tour" 
            show_board
            index = gets.chomp.to_i
            if @board.push_sign(@sign, index-1)
                end_round = true
            end
        end
        @turns += 1
        is_winner(@board.get_board)
        if !@winner
            change_sign
        end    
    end

    # swap sign
    def change_sign
        if @sign == "O"
            @sign = "X"
        elsif @sign == "X"
            @sign = "O"
        end
    end

    # checking if someone had won already
    def is_winner(board)
        for i in 0..2
            if board [0+3*i] == @sign && board[0+3*i] == board[1+3*i] && board[1+3*i] == board[2+3*i]
                @winner = true
            end
            if board[0+i] == @sign && board[0+i] == board[3+i] && board[3+i] == board[6+i]
                @winner = true
            end
            if board[0] == @sign && board[0] == board[4] && board[4] == board[8]
                @winner = true
            end
            if board[2] == @sign && board[2] == board[4] && board[4] == board[6]
                @winner = true
            end
        end
    end

    # game reset (if users would like to play again)
    def reset_to_basic
        @sign = "O"
        @turns = 0
        @winner = false
        @board = BoardManager.new
    end

    # intro information
    def intro
        puts "Hello, it's time to play tic-tac-toe"
        puts "Do you need rules"
        choice = gets.chomp
        if CONFIRMATIONS.include?(choice)
            display_rules
        elsif
            puts "Alright, so let's go, have fun"
        end
    end

    # managing showing rules and
    def display_rules
        Controller.get_instructions.each do |instruction|
            if instruction['type'] == 'normal'
                Controller.step_print(instruction['value'])
            elsif
                show_board(instruction['value'])
            end
        end
        puts "Everyhing is clear?"
        choice = gets.chomp
        if !CONFIRMATIONS.include?(choice)
            puts "So let's get into it one more time"
            display_rules
        end
    end

    # showing board (default board is this declared in the object)
    def show_board(board = @board.get_board)
        PRINT.board(board)
    end
end

# creating GameManager object (starting the game as program runs)
game = GameManager.new
