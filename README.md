motion-objection
================

Motion-objection wraps the Objective-C dependency injection library [Objection](https://github.com/atomicobject/objection) in Ruby so that it can be used in [RubyMotion](http://www.rubymotion.com/). It has all of the power (and speed) of Objection and the declarative affordances that the Ruby language provides.

<!-- [![Build Status](https://travis-ci.org/atomicobject/motion-objection.png)](https://travis-ci.org/atomicobject/motion-objection) -->
[![Gem Version](https://badge.fury.io/rb/motion-objection.png)](http://badge.fury.io/rb/motion-objection)
[![Code Climate](https://codeclimate.com/github/atomicobject/motion-objection.png)](https://codeclimate.com/github/atomicobject/motion-objection)

## Installation


```bash
gem install motion-objection
```

## Basic Usage

A class can declare requires component objects by mixing in <code>Objection::Compose</code> and calling the <code>.compose_with</code> method 

```ruby
class Car
  include Objection::Compose
  compose_with :engine, :brakes
end
```

Where <code>:engine</code> and <code>:brakes</code> are assumed to be the <code>Engine</code> and <code>Brakes</code> classes. Classes that are namespaced can be declared as well by separating the namespaces using the <code>/</code> character.

```ruby
class Engine
  include Objection::Compose
  compose_with 'engine/crank_shaft', 'engine/rod'

  class CrankShaft
  end 

  class Rod
  end
end
```

Sometimes you may need to declare the component object _and_ the class that is associated with it.

```ruby
class Brakes
compose_with factory: JSObjectFactory
end
```

## Singletons

Singletons can be declared by calling the <code>.singleton</code> method in the class body. Singletons should really only be necessary if they contain _shared state_. Otherwise it behooves you to avoid singletons in order to reduce the memory footprint of an application.

```ruby
class Holder
include Objection::Compose
singleton
end
```

## Awaking from Objection

Since Objection utilizes _setter_ based injection the initializer does not guarentee that all the object's dependencies have been satisfied.

The `awoken` class method can be given a block which will be invoked once the object has been fully instantiated.

```ruby
class Ship
  awoken do
    # Bootstrap listeners
  end
  
  awoken do
    # Setup other stuff
  end
end
```

## Default Initializers

Objection uses [Key-Value Coding](http://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/KeyValueCoding/Articles/KeyValueCoding.html) to compose an instance with its dependencies -- it does not use initializer injection.

By default Objection initializes an object using the <code>init</code> initializer. A custom initializer can be declared using the <code>.initializer</code> method.

```ruby
class ViewController < UIViewController
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

## Modules

Modules contribution configuration information to the Injector. Typically, this includes bindings for dependencies that the Injector cannot provide. For example, <code>UIApplication.sharedApplication</code> or the main application window.

```ruby
class AppModule < JSObjectionModule
  def initialize(window, application: application)
    @window = window
    @application = application
  end
  
  def configure
    bind @window, toClass: UIWindow
    bind @application, toClass: UIApplication
  end
end
```

There are a number of other configuration methods a module [provides](https://github.com/atomicobject/objection#modules).

## Bootstraping an Application

Typically an application is bootstrapped in the application delegate where an injector is created and set as the default injector via <code>.default_injector=</code>.

```ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    initialize_objection
    Objection.default_injector[ApplicationBootstrapper].bootstrap!
    true
  end
  
    def initialize_objection
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    injector = Objection.injector(BankersDashboardModule.new(@window, UIApplication.sharedApplication))
    Objection.default_injector = injector
  end
end

class ApplicationBootstrapper
  def bootstrap!
    # Bootstrap
  end
end
```
