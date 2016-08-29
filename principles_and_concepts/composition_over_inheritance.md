## Composition over inheritance

### Inheritance

```ruby
class Dog < Animal
  def greeting
    'bow wow'
  end
end

class BullDog < Dog
  def greeting
    'woof woof'
  end
end

class Pug < Dog
  def greeting
    'arf arf'
  end
end

class Husky < Dog
end
```

### Composition

```ruby
class DogGreetingSound
  def genral; 'bow wow'; end
  def bulldog; 'woof woof'; end
  def pug; 'arf arf'; end
end

class BullDog
  def initialize
    @greeting_sound = DogGreetingSound.new
  end

  def greeting
    @greeting_sound.bulldog
  end
end

class Pug
  def initialize
    @greeting_sound = DogGreetingSound.new
  end

  def greeting
    @greeting_sound.pug
  end
end

class Husky
  def initialize
    @greeting_sound = DogGreetingSound.new
  end

  def greeting
    @greeting_sound.general
  end
end
```

### Inheritance or Composition ?
It depends. If the relationship is less hierarchial, reaching for `composition` is usually a good bet. `Composition` tends to provide more flexibility and extensibility, espicially when attemping to model your code around a future which is largely unknown and in constant flux.