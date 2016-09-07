## Solution 1
Parse the number into bit string. Iterate this string and shift.

```ruby
def solution(n)
  max_gap = 0
  current_gap = 0

  n.to_s(2).chars.each do |c|
    if c == "1"
      if current_gap != 0
        max_gap = [max_gap, current_gap].max
        current_gap = 0
      end
    else
      current_gap += 1
    end
  end

  max_gap
end
```

## Solution 2
Using binary shift.

```ruby
def solution(n)
  max_gap = 0
  current_gap = 0

  loop do
    break if n == 0

    if (n & 1) == 1
      if current_gap != 0
        max_gap = [max_gap, current_gap].max
        current_gap = 0
      end
    else
      current_gap += 1
    end

    n = n >> 1
  end

  max_gap
end
```
