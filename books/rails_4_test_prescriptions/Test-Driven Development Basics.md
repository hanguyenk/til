## Test-Driven Development Basics

### Installing RSpec
- Add RSpec to Rails project:

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.1'
end
```

- Install:
```bash
$ bundle install
$ rails generate rspec:install
``
This generator creates the following: 
- The `.rspec` file, where RSpec run options go.
- The `spec` directory, which is where your specs go.
- The `spec_helper.rb` and `rails_helper.rb` files, which contain setup information. The `spec_helper.rb` file contains general RSpec settings while the `rails_helper.rb` file, which requires `spec_helper`, loads the Rails environment and contains settings that depend on Rails.


```
Prescription 3:
Initializing object is a good starting place for a TDD process. Another good approach is to use the test to design what you want a successful interaction of the future to look like.
```

```ruby
expect(project.done?).to be_truthy
```
-> First is the `expect` call itself, `expect(project.done?)`. RSpec defines the `expect` method, which takes in any object as an argument and returns a special RSpec proxy object called an `ExpectationTarget`
-> The `ExpectationTarget` holds on to the object that wa the argument to `expect`, and itself responds to two messages: `to` and `not_to`. Both `to` and `not_to` are ordinary Ruby methods that expect as an argument an RSpec matcher. 

Running an example group involves running each example that it contains, and that involves a few steps:
1. Run all `before(:example)` setup blocks. We'll talk about those more in a moment, when they become useful.
2. Run the example, which is the block argument to `it`. The method execution ends when a runtime error or a failed assertion is encountered. If neither of those happends, the test method passes.
3. Run all `after(:example)` teardown blocks. Teardown block are declared similarly to setup blocks, but their use is much less common
4. Roll back or delete fixtures. The result of each example is passed back to the test runner for display in the console or IDE window running the test.


- Using `let`, you can make a variable available within the current `describe` without having to place it inside the `before` block and without having to make it an instance variable.
- Each `let` method call takes a symbol argument and a block. The symbol can then be called as if it were a local variable: the first call to the symbol lazily invokes the block and caches the result, and subsequent calls return the same result without reinvoking the block. 

```
Prescription 4:
When possible, write your tests to describe your code's behavior, not its implementation.
```

```
Prescription 5:
Keeping your code as simple as possible allows you to focus complexity on the area that really need complexity
```

- In RSpec, anything in a `before(:each)` or `before(:example)` block is executed as part of the setup before each spec.

```
Prescription 6:
Choose your test data and test variable names to make it easy to diagnose failures when they happen. Meaningful names and data that doesn't overlap are helpful.
```

