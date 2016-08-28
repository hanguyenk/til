## Strategy Pattern

In `Strategy pattern`, a class behavior or its algorithm can be changed at run time. This type of design pattern comes under `behavior pattern`.

In `Strategy pattern`, we create objects which represent various strategies and a context object whose behavior varies as per its strategy object. The strategy object changes the executing algorithm of context object.

### Implementation

Create an interface.

```ruby
# operation_strategy.rb

class OperationStrategy
  def do_opeartion(num1, num2)
    raise NotImplementedYet
  end
end
```

Create concrete classes implementing the same interface.

```ruby
# operation_add.rb

class OperationAdd < OperationStrategy
  def do_operation(num1, num2)
    num1 + num2
  end
end
```

```ruby
# operation_subtract.rb

class OperationSubtract < OperationStrategy
  def do_operation(num1, num2)
    num1 - num2
  end
end
```

```ruby
# operation_mulitply.rb

class OperationMultiply < OperationStrategy
  def do_operation(num1, num2)
    num1 * num2
  end
end
```

Create `Context` class.

```ruby
class Context
  attr_reader :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def execute_strategy(num1, num2)
    strategy.do_operation(num1, num2)
  end
end
```

Use the `Context` to see change in behaviour when it changes its `Strategy`

```ruby
context = Context.new(OperationAdd.new)
puts "2 + 1 = #{context.execute_strategy(2, 1)}"

context = Context.new(OperationSubtract.new)
puts "2 - 1 = #{context.execute_strategy(2, 1)}"

context = Context.new(OperationMulitply.new)
puts "2 * 1 = #{context.execute_strategy(2, 1)}"
```
