motion-objection
================

Wrapping the dependency injection library [Objection](https://github.com/atomicobject/objection) in RubyMotion.

[![Build Status](https://travis-ci.org/atomicobject/motion-objection.png)](https://travis-ci.org/atomicobject/motion-objection)
[![Gem Version](https://badge.fury.io/rb/motion-objection.png)](http://badge.fury.io/rb/motion-objection)
[![Code Climate](https://codeclimate.com/github/atomicobject/motion-objection.png)](https://codeclimate.com/github/atomicobject/motion-objection)

## Install
```bash
gem install motion-objection
```
## Basic Example

```ruby
class Car
  include Objection::Compose
  compose_with :engine, :brakes, factory: JSObjectFactory
end

class Engine
  include Objection::Compose
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
  include Objection::Compose
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

## Default Injector

```ruby
Objection.default_injector = Objection.injector
```
