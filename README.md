motion-objection
================

Wrapping Objection in RubyMotion.

## Basic Example

```ruby
class Car
  include Objection
  compose_with :engine, :brakes
end

class Engine
  include Objection
  singleton
  compose_with 'engine/crank_shaft', 'engine/rod'

  def shift(wat)
    puts "SHIFT!"
  end

  class CrankShaft
  end 

  class Rod
  end
end

class Brakes
  def brake!
  end
end
```

## Initializers

```ruby
class ViewController < NSObject
  include Objection
  initializer "initWithNibName:bundle:", "Home"

  attr_reader :name

  def initWithNibName(name, bundle: bundle)
    self.init
    self.tap do
      @name = name
    end
  end
end
```
