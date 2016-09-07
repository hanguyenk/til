## Solution 1
Take advantage of exclusive or. A xor A cancels itself and B xor 0 is B. Therefore A xor A xor B xor C xor C is B.

```ruby
def solution(a)
  missing_int = 0

  for e in a
    missing_int = missing_int ^ e
  end

  missing_int
end
```

