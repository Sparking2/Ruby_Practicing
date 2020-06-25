
#@param day_array[Array]
def stock_picker(day_array = [])

    best_possible_profit = 0
    index_best_buy = 0
    index_best_sell = 0

    day_array.each_index do |current_day|
        
        profit = 0;
        profit = profit - day_array[current_day]

        day_array.each_index do | sell_day |
            if current_day < sell_day
                if (profit + day_array[sell_day]) > best_possible_profit
                    best_possible_profit = profit + day_array[sell_day]
                    index_best_buy = current_day
                    index_best_sell = sell_day
                end
            end
        end
        
    end

    return [index_best_buy,index_best_sell]

end


p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([10,3,6,9,15,8,6,1,17])
p stock_picker([17,15,6,9,3,8,6,10,1])