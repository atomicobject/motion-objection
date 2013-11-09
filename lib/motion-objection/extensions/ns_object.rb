class NSObject
  include Objection::Awoken

  def default_injector
    Objection.default_injector
  end
end
