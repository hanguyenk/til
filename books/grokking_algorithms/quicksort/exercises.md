```
4.1 Write out the code for the earlier `sum` function.
```

```ruby
def sum(arr)
  arr.size == 0 ? 0 : arr.pop + sum(arr)
end
```

```
4.2 Write a recursive function to count the number of items in a list.
```

```ruby
Cell = Struct.new(:value, :next)
cell6 = Cell.new(6)
cell5 = Cell.new(5, cell6)
cell4 = Cell.new(4, cell5)
cell3 = Cell.new(3, cell4)
cell2 = Cell.new(2, cell3)
cell1 = Cell.new(1, cell2)

def size(cell, _size = 0)
  if cell.next.nil?
    return _size + 1
  else
    size(cell.next, _size + 1)
  end
end

puts size(cell1)
```

```
4.3 Find the maximum number in a list.
```

```ruby
Cell = Struct.new(:value, :next)
cell6 = Cell.new(6)
cell5 = Cell.new(5, cell6)
cell4 = Cell.new(4, cell5)
cell3 = Cell.new(3, cell4)
cell2 = Cell.new(2, cell3)
cell1 = Cell.new(1, cell2)

def max(cell, _max = nil)
  _max ||= cell.value
  _cur_max = _max > cell.value ? _max : cell.value

  if cell.next.nil?
    _cur_max
  else
    max(cell.next, _cur_max)
  end
end

puts max(cell1)
```

```
4.4 Remember binary search from chapter 1? It’s a divide-and-conquer algorithm, too. Can you come up with the base case and recursive case for binary search?
```

```ruby
def binary_search(arr, item, low = 0, high = nil)
  high ||= arr.size - 1

  mid = (low + high) / 2
  guess = arr[mid]

  if low <= high
    return mid if guess == item

    if guess > item
      binary_search(arr, item, low, mid - 1)
    else
      binary_search(arr, item, mid + 1, high)
    end
  else
    return nil
  end
end

my_list = [1, 3, 5, 7, 9]
puts binary_search(my_list, 3)
```

```
How long would each of these operations take in Big O notation?
4.5 Printing the value of each element in an array.
```
=> O(n)

```
4.6 Doubling the value of each element in an array.
```
=> O(n)

```
4.7 Doubling the value of just the first element in an array.
```
=> O(1)

```
4.8 Creating a multiplication table with all the elements in the array. So if your array is [2, 3, 7, 8, 10], you  first multiply every element by 2, then multiply every element by 3, then by 7, and so on.
```
=> O(n^2)
