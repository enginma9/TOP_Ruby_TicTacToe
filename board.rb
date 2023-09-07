
class Board
    def initialize()
        @available_slots = Array.new()
        @current_slots = Array.new()
        @win_conditions = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
        ]
        @row = Array.new
        self.refill()
    end

    def play( slot_number = 0 , symbol = "X" )
        #remove number.to_s from available / change that slot to ""
        @available_slots[ slot_number.to_i - 1 ] = ""
        #p @available_slots
        @current_slots[ slot_number.to_i - 1 ] = symbol
        show_board()
        #add given symbol to @current_slots[slot_number]
        winner?(symbol) # This will return true or false to whatever calls play.  
    end

    def test()
        @current_slots = @current_slots.map do |slot|
            slot = "X"
        end
        winner?("X")
    end

    def winner?(symbol)
        check_against = Array.new(3, symbol)
        winning = false
        @win_conditions.each do |condition|
            # for each of the integer arrays in win_conditions, see if all three are the desired character
            check_these = condition.map do |x|
                @current_slots[x]
            end
            #puts check_these.join
            #puts check_against.join
            if check_these.join == check_against.join
                winning = true
                #
            end
        end
        return winning
    end

    def show_board()
        #puts @slots[0-2].join(@divider[0]) + @divider[1] + @slots[1].join(@divider[0]) + @divider[1] + @slots[2].join(@divider[0])
        @row[0] = " #{@current_slots[0]} | #{@current_slots[1]} | #{@current_slots[2]} "
        @row[1] = "\n---+---+---\n"
        @row[2] = " #{@current_slots[3]} | #{@current_slots[4]} | #{@current_slots[5]} "
        @row[3] = "\n---+---+---\n"
        @row[4] = " #{@current_slots[6]} | #{@current_slots[7]} | #{@current_slots[8]} "
        puts @row.join
    end

    def open_slots()
        return @available_slots
    end

    def tied?()
        tied_status = true
        @available_slots.each do |x|
            # if you can only find empty strings, return true
            if x == ""
                #
            else
                tied_status = false
            end
        end
        return tied_status
    end

    def refill()
        @available_slots = ["1","2","3","4","5","6","7","8","9"]
        @current_slots = ["1","2","3","4","5","6","7","8","9"]
    end
end
