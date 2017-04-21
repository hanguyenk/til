def binary_search(list, item)
  low = 0
  high = list.size - 1

  while low <= high
    mid = (low + high)
    guess = list[mid]
    return mid if guess == item
    if guess > item
      high = mid - 1
    else
      low = mid + 1
    end
  end

  return nil
end

my_list = [1, 3, 5, 7, 9]
puts binary_search(my_list, 3)
puts binary_search(my_list, -1)
