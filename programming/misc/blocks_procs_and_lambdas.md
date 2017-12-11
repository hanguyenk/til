## Blocks, procs and lambdas in Ruby

### TLDR
- Procs are objects, blocks are not
  + A Proc is an instance of the Proc class
  + A Block is just part of the *syntax* of a method call
- At most one block can appear in an argument list, in contrast, you can pass multiple procs to methods
- Lambdas check the number of arguments, while procs do not
- Lambdas and procs treat the 'return' keyword differently
- Lambdas ~ lambda calculus | Proc ~ procedure

### What are blocks, procs and lambdas ?
```ruby
#======================= Blocks ==============================

# blocks is in between the curly braces
[1, 2, 3].each { |x| puts x*2 } 

# blocks in in between the do and the end
[1, 2, 3].each do |x|
  puts x*2
end

#======================= Procs ===============================

# the `&` tells Ruby to turn the proc into a block
p = Proc.new { |x| puts x*2 }
[1, 2, 3].each(&p)

# the body of the Proc object gets executed when called
proc = Proc.new { puts "Hello World" }
proc.call 

#======================= Lambdas =============================

# the same as procs below
l = lambda { |x| puts x*2 }
[1, 2, 3].each(&l)

lam = lambda { puts "Hello World" }
lam.call
```

### Different between Blocks and Procs
#### Procs are objects, blocks are not
A proc (notice the lowercase p) is an instance of the Proc class.

```ruby
p = Proc.new { puts "Hellow World" }
```

This lets us call methods on it and assign it to variables. Procs can also return themselves.
```ruby
p.call # prints `Hello World`
p.call # returns `Proc`
a = p # a now equals p, a Proc instance
p # returns a proc object
```

In contrast, a block is just a part of the *syntax* of a method call. It doesn't mean anything on a standalone basis and can only appear in argurment lists.
``` ruby
{ puts "Hello World" } # syntax error
a = { puts "Hello World" } # syntax error
[1, 2, 3].each { |x| puts x*2 } # only works as a part of the syntax of method call
```

#### At most on block can appear in an argument list
In contrast, you can pass multiple procs to methods.

```ruby
def multiple_procs(proc1, proc2)
  proc1.call
  proc2.call
end

a = Proc.new { puts "First proc" }
b = Proc.new { puts "Second proc" }
multiple_procs(a, b)
```

### Differences between Procs and Lambdas
Both a proc and a lambda are instance of Proc class

```ruby
p = Proc.new { puts "Hello World" }
l = lambda { puts "Hello World" }
p.class # returns `Proc`
l.class # returns `Proc`
```

However, labmdas are a different 'flavor' of procs. This slight differece is shown when returning objects.

```ruby
p   # returns '#<Proc:0x007f96b1032d30@(irb):75>'
l    # returns '<Proc:0x007f96b1b41938@(irb):76 (lambda)>'
```

The lambda notation is a reminder that while procs and lambdas are very similar, even both instances of the Proc class, they are also slightly different. Below are the key differences

#### Lambdas check the number of arguments, while procs do not

```ruby
lam = lambda { |x| puts x } # creates a lambda that takes 1 argument
lam.call(2)                 # prints out 2
lam.call                    # ArgumentError
lam.call(1, 2, 3)           # ArgumentError
```
In contrast, procs don't care if they are passed the wrong number of arguments.

```ruby
proc = Proc.new { |x| puts x } # creates a proc that takes 1 argument
proc.call(2)                   # prints out 2
proc.call()                    # returns nil
proc.call(1, 2, 3)             # prints out 1 and forgets about the extra arguments
```

As shown above, procs don't freak out and raise errors if they are passed the wrong number of arguments. If the proc requires an argument but no argument is passed then the proc returns nil. If too many arguments are passed then it ignores the extra arguments.

#### Lambdas and procs treat the 'return' keyword differently

'return' inside of a lambda triggers the code right outside of the lambda code
```ruby
def lambda_test
  lam = lambda { return }
  laml.call
  puts "Hello World"
end

lambda_test # calling lambda_test prints 'Hello World'
```

'return' inside of a proc triggers the code outside of the method where the proc is being executed
```ruby
def proc_test
  proc = Proc.new { return }
  proc.call
  puts "Hello World"
end

proc_test # calling proc_test prints nothing
```
