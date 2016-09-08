# Solution 1
Calculate total sum of array then iterate each index that can be `P`, calculate the difference and compare with minimum value.

```ruby
def solution(a)
  max_index = a.length - 1
  total_sum = a.inject(:+)
  left_sum = a[0]
  cur_diff = (total_sum - 2.0*left_sum).abs
  min_diff = cur_diff

  for i in 2..(max_index-1)
    left_sum += a[i-1]
    cur_diff = (total_sum - 2.0*left_sum).abs
    min_diff = [min_diff, cur_diff].min
  end

  min_diff
end
```
