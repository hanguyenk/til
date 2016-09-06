## Singleton pattern

`Singleton pattern` comes under `creatational pattern` as this pattern provides one of the best ways to create an object.

This pattern involves a single class which is responsible to create an object while making sure that only single object gets created. This class provides a way to access its only objects which can be accessed directly without need to instantiate the object of the class.

### Implementation

#### Standard way

Create a `Singleton` class.

```ruby
class SingleObject
  @@instance = SingleObject.new

  def instance
    @@instance
  end

  def show_message
    puts 'Hello world!'
  end

  private_class_method :new
end
```

Get the only object from the singleton class.

```ruby
object = SingleObject.instance
object.show_message
```

#### Ruby way

Create a `Singleton` class

```ruby
require 'singleton'

class SingleObject
  include Singleton

  def show_message
    puts 'Hello world!'
  end
end
```

Get the only object from the singleton class.

```ruby
object = SingleObject.instance
object.show_message
```
