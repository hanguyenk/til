## Template pattern

In `Template pattern`, an abstract class exposes defined way(s)/template(s) to execute its methods. Its subclasses can override the method implementation as per need but the invocation is to be in the same way as defined by an abstract class. This pattern comes under `behavior pattern` category.

### Implementation
Create an abstract class with a template method.

```ruby
# game.rb

class Game
  def init_game
    raise NotImplementedYet
  end

  def start_game
    raise NotImplementedYet
  end

  def end_game
    raise NotImplementedYet
  end

  def play
    init_game
    start_game
    end_game
  end
end
```

Create concrete classes extending the above class.

```ruby
# cricket.rb

class Cricket < Game
  def init_game
    puts "Cricket Game Initialized! Start playing."
  end

  def start_game
    puts "Cricket Game Started. Enjoy the game!"
  end

  def end_game
    puts "Cricket Game Finished!"
  end
end
```

```ruby
# football.rb

class Football < Game
  def init_game
    puts "Football Game Initialized! Start playing."
  end

  def start_game
    puts "Football Game Started. Enjoy the game!"
  end

  def end_game
    puts "Football Game Finished!"
  end
end
```

Use the `Game`'s template method `play()` to demonstrate a defined way of playing game.

```ruby
game = Cricket.new
game.play
puts "=" * 30
game = Football.new
game.play
```
