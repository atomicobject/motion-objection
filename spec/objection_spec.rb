describe "Objection" do
  before do
    @injector = Objection.injector
  end

  it "can construct an object with dependencies" do
    @car = @injector.getObject Car
    @car.engine.class.should.be.same_as Engine
    @car.brakes.class.should.be.same_as Brakes
  end

  it "has support for singletons" do
    @engine1 = @injector.getObject Engine
    @engine2 = @injector.getObject Engine
   
    @engine1.should.be.same_as @engine2
  end

  it "will not construct a singleton by default" do
    @brakes1 = @injector.getObject Brakes
    @brakes2 = @injector.getObject Brakes 
   
    @brakes1.should.not.be.same_as @brakes2
  end

  it "understands namespaced classes" do
    @engine = @injector.getObject Engine

    @engine.crank_shaft.class.should.be.same_as Engine::CrankShaft
    @engine.rod.class.should.be.same_as Engine::Rod
  end
end
