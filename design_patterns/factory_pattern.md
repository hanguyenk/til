## Factory Pattern

`Factory pattern` comes under `creational pattern` as this pattern provides one of the best ways to create an object.

In `Factory pattern`, we create object without exposing the creation logic to the client and refer to newly created object using common interface.

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
    puts "Inside Rectangle::draw() method."
  end
end
```

```ruby
# square.rb

class Square < Shape
  def draw
    puts "Inside Square::draw() method."
  end
end
```

```ruby
# circle.rb

class Circle < Shape
  def draw
    puts "Inside Circle::draw() method."
  end
end
```

Create a `Factory` to generate object of concrete class based on given information.

```ruby
# shape_factory.rb

class ShapeFactory
  def get_shape(shape_type)
    return if shape_type.nil?

    case shape_type.downcase
    when 'circle'
      Circle.new
    when 'rectangle'
      Rectangle.new
    when 'square'
      Square.new
    end
  end
end
```

Use the `Factory` to ge object of concrete class by passing an information such as stype.

```ruby
shape_factory = ShapeFactory.new
shape1 = shape_factory.get_shape('circle')
shape1.draw
shape2 = shape_factory.get_shape('rectangle')
shape2.draw
shape3 = shape_factory.get_shape('square')
shape3.draw
```


