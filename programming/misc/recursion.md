## Recursion

### Head recursion
```ruby
def factorial(n)
  n == 0 ? 1 : n * factorial(n-1)
end
```

### Tail recursion

```ruby
def factorial(n, accum = 1)
  n == 0 ? accum : factorial(n-1, accum * n)
end
```
