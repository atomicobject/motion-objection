describe "Objection" do
  before do
    @injector = Objection.injector
  end

  describe "dependency injection" do
    it "supports inheritance" do
      @engine = @injector[V6Engine]

      @engine.crank_shaft.class.should.be.same_as Engine::CrankShaft
      @engine.rod.class.should.be.same_as Engine::Rod
    end

    it "can construct an object with dependencies" do
      @car = @injector.get_object Car
      @car.engine.class.should.be.same_as Engine
      @car.brakes.class.should.be.same_as Brakes
    end

    it "has support for singletons" do
      @engine1 = @injector[Engine]
      @engine2 = @injector[Engine]
     
      @engine1.should.be.same_as @engine2
    end

    it "will not construct a singleton by default" do
      @brakes1 = @injector[Brakes]
      @brakes2 = @injector[Brakes]
     
      @brakes1.should.not.be.same_as @brakes2
    end

    it "understands namespaced classes" do
      @engine = @injector[Engine]

      @engine.crank_shaft.class.should.be.same_as Engine::CrankShaft
      @engine.rod.class.should.be.same_as Engine::Rod
    end
  end

  describe "modules" do
    before do
      @app_module = AppModule.alloc.init
      @app_module2 = AppModuleII.alloc.init
    end

    it "has support for an injector with a module" do
      @injector = Objection.injector @app_module

      @injector[Engine].should.equal @app_module.v6_engine
    end

    it "has support for an injector with multiple modules" do
      @injector = Objection.injector @app_module, @app_module2

      @injector[Engine].should.equal @app_module.v6_engine
      @injector[Brakes].should.respond_to? :abs_brake!
    end
  end

  describe "initializer" do
    it "has support for default initializers"
  end
end
