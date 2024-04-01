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
