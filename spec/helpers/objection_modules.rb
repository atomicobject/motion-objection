class AppModule < JSObjectionModule
  attr_reader :v6_engine

  def init 
    super.tap do
      @v6_engine = V6Engine.new
    end
  end

  def configure
    bind @v6_engine, toClass: Engine
  end
end

class AppModuleII < JSObjectionModule
  def configure
    bindClass ABSBrakes, toClass: Brakes
  end
end
