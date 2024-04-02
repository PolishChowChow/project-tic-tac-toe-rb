class Print
    LINE = "-------"
    def self.board(arr)
        puts LINE
        for i in 0..arr.length-1
            if(arr[i] === "X" || arr[i] === "O")
                print_one_value(arr[i])
            elsif
                print_one_value(" ")
            end
            if (i+1)%3 == 0
                print_new_line
            end
        end
    end
    def self.print_new_line
        print "|"
        puts ""
        puts LINE
    end
    def self.print_one_value(value)
        print "|#{value}"
    end
end

class BoardManager
    EMPTY_BOARD = ["","","","","","","","",""]
    @@board = EMPTY_BOARD
    def self.push_sign(sign, index)
        if index > 9 || index < 1
            puts "bad index, index has to be greater than 1 and smaller than 9"
        elsif
            @@board[index] = sign
        end
    end
    def self.reset_game
        @@board = EMPTY_BOARD
    end
end

class GameManager
    @sign = "O"
    def change_sign
        if @sign == "O"
            @sign = "X"
        elsif @sign == "X"
            @sign = "O"
        end
    end
    def is_wiinner(board)
        for i in 0..2
            if board[0+3*i] == board[1+3*i] && board[1+3*i] == board[2+3*i]
                return true
            end
        end
    end
end