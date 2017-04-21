def find_smallest(arr)
  smallest = arr[0]
  smallest_index = 0

  for i in 1.upto(arr.size - 1)
    if arr[i] < smallest
      smallest = arr[i]
      smallest_index = i
    end
  end

  return smallest_index
end

def selection_sort(arr)
  new_arr = []

  for i in 0.upto(arr.size - 1)
    smallest = find_smallest(arr)
    new_arr.push(arr.delete_at(smallest))
  end

  return new_arr
end
