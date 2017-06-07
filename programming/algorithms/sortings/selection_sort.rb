require_relative 'sorting_algorithm_abstract'

module SortingAlgorithms
  class SelectionSort
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

    def run(arr)
      new_arr = []
      cloned_arr = arr.clone # Not touch to the original object

      for i in 0.upto(cloned_arr.size - 1)
        puts "DEBUG | array: #{new_arr}"
        puts "-----------------------"
        smallest = find_smallest(cloned_arr)
        new_arr.push(cloned_arr.delete_at(smallest))
      end

      return new_arr
    end
  end
end
