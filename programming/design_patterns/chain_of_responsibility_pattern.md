## Chain of responsibility pattern

The `chain of responsibility pattern` creates a chain of receiver objects for a request. This pattern decouples sender and receiver of a request based on type of request. This pattern comes under `behavioral patterns`.

In this pattern, normally each receiver contains reference to another receiver. If one object cannot handle the request then it passes the same to the next receiver and so on.

### Implementation

Create an abstract logger class.

```ruby
# abstract_logger.rb

class AbstractLogger
  INFO = 1
  DEBUG = 2
  ERROR = 3

  attr_reader :level
  attr_accessor :next_logger

  def initialize(level)
    @level = level
  end

  def log_message(level, message)
    write(message) if @level <= level
    @next_logger.log_message(level, message) unless @next_logger.nil?
  end

  protected

    def write(message)
      raise NotImplementedYet
    end
end
```

Create concrete classes extending the logger.

```ruby
# console_logger.rb

class ConsoleLogger < AbstractLogger
  protected
    def write(message)
      puts "Console::Logger: #{message}"
    end
end
```

```ruby
# error_logger.rb

class ErrorLogger < AbstractLogger
  protected
    def write(message)
      puts "Error::Logger: #{message}"
    end
end
```

```ruby
# file_logger.rb

class FileLogger < AbstractLogger
  protected
    def write(message)
      puts "File::Logger: #{message}"
    end
end
```

Create different types of loggers. Assign them error levels and set next logger in each logger. Next logger in each logger represents the part of the chain.

```ruby
def my_logger
  error_logger = ErrorLogger.new(AbstractLogger::ERROR)
  file_logger = FileLogger.new(AbstractLogger::DEBUG)
  console_logger = ConsoleLogger.new(AbstractLogger::INFO)

  error_logger.next_logger = file_logger
  file_logger.next_logger = console_logger
  error_logger
end

logger_chain = my_logger
logger_chain.log_message(AbstractLogger::INFO, 'This is an information.')
logger_chain.log_message(AbstractLogger::DEBUG, 'This is an debug level information.')
logger_chain.log_message(AbstractLogger::ERROR, 'This is an error information.')
```
