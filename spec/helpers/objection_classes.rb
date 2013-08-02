class Car
  include Objection
  compose_with :engine, :brakes
end

class Engine
  include Objection
  singleton

  def shift(wat)
  end
end

class Brakes
  def brake!
  end
end
