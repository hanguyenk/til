require_relative 'array'
require_relative 'selection_sort'
require_relative 'quick_sort'
require_relative 'merge_sort'

arr = [1 , 123, 999, 2, 4, -1]
puts "Unsorted array: #{arr}"
puts "Selection Sort:"
arr.set_sort_algorithm(SortingAlgorithms::SelectionSort.new)
puts "Sorted array: #{arr.sort}"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Quick Sort:"
arr.set_sort_algorithm(SortingAlgorithms::QuickSort.new)
puts "Sorted array: #{arr.sort}"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Merge Sort:"
arr.set_sort_algorithm(SortingAlgorithms::MergeSort.new)
puts "Sorted array: #{arr.sort}"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
