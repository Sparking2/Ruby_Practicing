
#@param array_to_sort[Array]
def bubble_sort(array_to_sort)
    
    swaped = false
    temp_lower = 0
    temp_higher = 0

    loop do
        swaped = false
        array_to_sort.each_index do |current_index|
            unless (array_to_sort[current_index] == array_to_sort.last)
                if array_to_sort[current_index] > array_to_sort[current_index + 1]
                    swaped = true
                    temp_lower = array_to_sort[current_index + 1]
                    temp_higher = array_to_sort[current_index]
                    array_to_sort[current_index] = temp_lower
                    array_to_sort[current_index + 1] = temp_higher
                end
            end
        end
        break if swaped == false
    end
    return array_to_sort
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort([54,26,93,17,77,31,44,55,20])