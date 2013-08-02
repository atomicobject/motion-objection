describe "Objection" do
  before do
    @injector = Objection.injector
  end

  it "can construct an object with dependencies" do
    @car = @injector.getObject Car
    puts "UAJ"
    @car.engine.shift :up
  end
end
