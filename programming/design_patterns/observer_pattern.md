## Observer pattern

`Observer pattern` is used when there is one-to-many relationship between objects such as if one object is modified, its dependent objects are to be notified automatically.

`Observer pattern` falls under `behavioral pattern` category.

### Implementation

#### Standard way

Create `Subject` class.

```ruby
# subject.rb

class Subject
  attr_reader :state

  def initialize
    @observers = {}
  end

  def state=(state)
    @state = state
    notify_all_observer
  end

  def register_observer(key, observer)
    @observers[key] = observer
  end

  def remove_observer(key)
    @observers.delete(key)
  end

  def notify_all_observer
    @observers.each do |key, observer|
      observer.update
    end
  end
end
```

Create `Observer` class

```ruby
# observer.rb

class Observer
  attr_reader :subject

  def update
    raise NotImplementedYet
  end
end
```

Create concrete observer classes.

```ruby
# binary_observer.rb

class BinaryObserver < Observer
  def initialize(subject)
    @subject = subject
    @subject.register_observer('binary', self)
  end

  def update
    puts "Binary String: #{@subject.state.to_s(2)}"
  end
end
```

```ruby
# octal_observer.rb

class OctalObserver < Observer
  def initialize(subject)
    @subject = subject
    @subject.register_observer('octal', self)
  end

  def update
    puts "Octal String: #{@subject.state.to_s(8)}"
  end
end
```

```ruby
# hexa_observer.rb

class HexaObserver < Observer
  def initialize(subject)
    @subject = subject
    @subject.register_observer('hexa', self)
  end

  def update
    puts "Hexa String: #{@subject.state.to_s(16)}"
  end
end
```

Use `Subject` and concrete observer object.

```ruby
subject = Subject.new
BinaryObserver.new(subject)
OctalObserver.new(subject)
HexaObserver.new(subject)

puts "First state change: 15"
subject.state = 15
puts "Second state change: 40"
subject.state = 40
```

#### Ruby way

Create `Subject` class.

```ruby
# subject.rb

require 'observer'

class Subject
  include Observable

  attr_reader :state

  def state=(state)
    @state = state
    changed
    notify_observers
  end
end
```


Create `Observer` class

```ruby
# observer.rb

class Observer
  attr_reader :subject

  def initialize(subject)
    @subject = subject
    @subject.add_observer(self)
  end

  def update
    raise NotImplementedYet
  end
end
```

Create concrete observer classes.

```ruby
# binary_observer.rb

class BinaryObserver < Observer
  def update
    puts "Binary String: #{@subject.state.to_s(2)}"
  end
end
```

```ruby
# octal_observer.rb

class OctalObserver < Observer
  def update
    puts "Octal String: #{@subject.state.to_s(8)}"
  end
end
```

```ruby
# hexa_observer.rb

class HexaObserver < Observer
  def update
    puts "Hexa String: #{@subject.state.to_s(16)}"
  end
end
```

Use `Subject` and concrete observer object.

```ruby
subject = Subject.new
BinaryObserver.new(subject)
OctalObserver.new(subject)
HexaObserver.new(subject)

puts "First state change: 15"
subject.state = 15
puts "Second state change: 40"
subject.state = 40
```
