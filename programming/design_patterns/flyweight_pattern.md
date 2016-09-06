## Flyweight pattern

`Flyweight pattern` is primarily used to reduce the number of objects created and to decrease memory footprint and increase performance. This type of design pattern comes under `structural pattern` as this pattern provides ways to decrease object count thus improving the object structure of application.

`Flyweight pattern` tries to reuse already existing similar kind objects by storing them and creates new object when no matching object is found.

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

Create concrete class implementing the same interface

```ruby
class Circle < Shape
  attr_accessor :x, :y, :radius
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def draw
    puts "Circle: Draw() [Color : #{color}, x: #{x}, y: #{y}, radius: #{radius}"
  end
end
```

Create a factory to generate object of concrete class based on given information

```ruby
class ShapeFactory
  @@circle_map = {}

  def self.get_circle(color)
    circle = @@circle_map.fetch(color, nil)

    if circle.nil?
      circle = Circle.new(color)
      @@circle_map[color] = circle
      puts "Creating circle of color: #{color}"
    end

    circle
  end
end
```

Use the factory to get object of concrete class by passing an information such as color.

```ruby
colors = %w(red green blue white black)

20.times do |i|
  circle = ShapeFactory.get_circle(colors.sample)
  circle.x = rand(100)
  circle.y = rand(100)
  circle.radius = 100
  circle.draw
end
```
