require_relative 'sorting_algorithm_abstract'

module SortingAlgorithms
  class QuickSort < SortingAlgorithmAbstract
    def run(array, from = 0, to = nil)
      to = array.count - 1 if to.nil? # Sort the whole array by default
      return array if from >= to # Done sorting
      pivot = array[from] # Take a pivot value, at the far left
      min, max = from, to # Min and Max pointers
      free = min # Current free slot
      puts "DEBUG | array: #{array}"
      puts "DEBUG | pivot: #{pivot}"
      puts "-----------------------"
      while min < max
        if free == min # Evaluate array[max]
          if array[max] <= pivot # Smaller than pivot, must move
            array[free] = array[max]
            min += 1
            free = max
          else
            max -= 1
          end
        elsif free == max # Evaluate array[min]
          if array[min] >= pivot # Bigger than pivot, must move
            array[free] = array[min]
            max -= 1
            free = min
          else
            min += 1
          end
        else
          raise "Inconsistent state"
        end
      end

      array[free] = pivot

      run array, from, free - 1
      run array, free + 1, to
    end
  end
end
