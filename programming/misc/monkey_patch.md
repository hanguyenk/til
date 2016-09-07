## Monkey Patch

The definition of the term varies depending upon the community using it. In `Ruby`, `Python`, and many other `dynamic programing languages`, the term `monkey patch` only refers to dynamic modifications of a class or module at runtime, motivated by the intent to patch exising third-party code as workaround to a bug or feature which does not act as desired.

### When it is used ?

In Ruby, `Monkey patching` is mostly used to:

- Replace methods / attributes / functions at runtime.

  ```ruby
  class Dog
    def greeting
      "bow wow"
    end
  end

  milu = Dog.new
  puts milu.greeting #=> "bow wow"

  class Dog
    def greeting
      "awf awf"
    end
  end

  puts milu.greeting #=> "awf awf"
  ```

- Modify / extend behaviour of third-party product without maintaining a private copy of source code.

  ```ruby
  class Document
    attr_accessor :title, :author, :content
    def initialize(title, author, content)
      @title = title
      @author = author
      @content = content
    end
  end

  class String
    def +(other)
      if other.kind_of? Document
        new_content = self + other.content
        return Document.new(other.title, other.author, new_content)
      end
      result = self.dup
      result << other.to_str
      result
    end
  end
  ```

  ```ruby
  class Document
    attr_accessor :title, :author, :content
    def initialize(title, author, content)
      @title = title
      @author = author
      @content = content
    end
  end

  class String
    alias_method :old_addition, :+

    def +(other)
      if other.kind_of? Document
        new_content = self + other.content
        return Document.new(other.title, other.author, new_content)
      end
      old_addition(other)
    end
  end
  ```

- Distribute security or behavioural fixes that live alongside the original code

  ```ruby
  require 'date'

  module CoreExtensions
    module String
      module ConvertingDate
        def to_s_date
          Date.parse(self).strftime('%Y/%m/%d')
        end
      end
    end
  end

  String.include CoreExtensions::String::ConvertingDate

  p '20160605'.to_s_date # =>"2016/06/05"
  ```

### Pitfalls
Carelessly written or poorly documented monkey patches can lead to problems:
- They can lead to upgrade problems when the patch makes assumptions about patched object that are no longer true; if the product you have changed changes with a new release it may very well break your patch. For this reason monkey patches are often made conditional, and only applied if appropirate.
- If two modules attemp to monkey patch the same method, one of them (whichever one runs last) "wins" and the other patch has no effect, unless monkey patches are written with a pattern like `alias_method_chain`.
- They create a discrepancy between the original source code on disk and the observed behaviour that can be very confusing to anyone unaware of the patches's existence.
