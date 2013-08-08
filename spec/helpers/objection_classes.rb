class Car
  include Objection
  compose_with :engine, :brakes, factory: JSObjectFactory
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

class V6Engine < Engine
  compose_with factory: JSObjectFactory
end

class Brakes
  def brake!
  end
end

class ABSBrakes < Brakes
  def abs_brake!
  end
end

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
