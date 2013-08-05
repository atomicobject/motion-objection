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

class V6Engine < Engine; end

class Brakes
  def brake!
  end
end

class ABSBrakes < Brakes
  def abs_brake!
  end
end
