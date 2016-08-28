## Decorator Pattern

`Decorator pattern` allows a user to add new functionality to an existing object without altering its structure. This type of design pattern comes under `structural pattern` as this pattern acts as a wrapper to existing class.

This pattern creates a decorator class which wraps the original class and provides additional functionality keeping class methods signature intact.

### Implementation

Create an interface.

```ruby
# shape.rb

class Shape
  def draw
    raise NotImplementedYet
  end
end
```

Create concrete classes implementing the same interface.

```ruby
# rectangle.rb

class Rectangle < Shape
  def draw
    puts "Shape: Rectangle"
  end
end
```

```ruby
# circle.rb

class Circle < Shape
  def draw
    puts "Shape: Circle"
  end
end
```

Create abstract decorator class implementing `Shape` interface.

```ruby
# shape_decorator.rb

class ShapeDecorator < Shape
  def initialize(decorated_shape)
    @decorated_shape = decorated_shape
  end

  def draw
    @decorated_shape.draw()
  end
end
```

Create concrete decorator class extending the `ShapeDecorator` class.

```ruby
# red_shape_decorator.rb

class RedShapeDecorator < ShapeDecorator
  def draw
    @decorated_shape.draw()
    set_red_border
  end

  private

    def set_red_border
      puts "Border Color: Red"
    end
end
```

Use the `RedShapeDecorator` to decorate `Shape` objects

```ruby
circle = Circle.new
red_circle = RedShapeDecorator.new(Circle.new)
red_rectangle = RedShapeDecorator.new(Rectangle.new)

puts "Circle with normal border"
circle.draw

puts "\nCircle of red border"
red_circle.draw

puts "\nRectangle of red border"
red_rectangle.draw
```
