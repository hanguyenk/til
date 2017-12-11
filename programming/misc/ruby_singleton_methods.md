## Ways to define singleton methods in Ruby
Singleton methods are methods that live in the singleton class and are only available for a single object (unlike regular instance methods that are available to all instances of the class). Singleton methods are often referred to as class methods, but that's confusing because Ruby doesn't have class methods. This post outlines the many different ways singleton methods can be defined.

Methods defined with dot notation are singleton methods for the receiver object.
```ruby
s = "a string"
def s.meth; end
s.singleton_methods #=> [:meth]
```

The `instance_eval()` method evaluates the block in the context of the receiver, so methods defined in an `instance_eval()` block are singleton methods for the receiver. 
```ruby
x = 'moo'
x.instance_eval do 
  def cow; end
end
x.singleton_methods #=> [:cow]
```

`Object#define_singleton_method()` is the most explicit way to define singleton methods.
```ruby
word = 'boo'

word.define_singleton_method(:hi) do 
  'hey!'
end
word.hi #=> 'hey!'
word.singleton_methods #=> [:hi]
```

Singleton methods for class objects can be added by opening the singleton class and defining the methods. After all, singleton methods are simply instance methods defined in the singleton class.

```ruby
class A 
  class << self # opens the singleton class
    def coolio; end
  end # closes singleton class 
end
A.singleton_methods #=> [:coolio]
```

Extending a class with a module adds all the methods from the module to the object's singleton class as singleton methods

```ruby
module M
  def surf; end
end

class Watersport 
  extend M
end

Waterport.singleton_methods #=> [:surf]
```

The most common technique for adding singleton methods to classes is with dot notation (same idea as the first example):

```ruby
class Fish
  def Fish.swim; end
  def self.yummy?; end
end
Fish.singleton_methods #=> [:swim, :yummy?]
```

When adding singleton methods to a class, it's better to use the self keyword instead of the class name, so if the class name changes, edites are not required in multiple places/

