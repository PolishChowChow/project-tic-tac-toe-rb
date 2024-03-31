LINE = "-------"
class Print
    LINE = "-------"
    def self.board(arr)
        puts LINE
        for i in 0..arr.length-1
            if(arr[i] === "X" || arr[i] === "O")
                self.printOneValue(arr[i])
            elsif
                self.printOneValue(" ")
            end
            if (i+1)%3 == 0
                print "|"
                puts ""
                puts LINE
            end
        end
    end
    def printsNewLine
        print "|"
        puts ""
        puts LINE
    end
    def self.printOneValue(value)
        print "|#{value}"
    end
end

Print.board([1,2,3,4,5,6,7,8,9])
Print.board(["O","X","O","X","O","O","X","X","X"])