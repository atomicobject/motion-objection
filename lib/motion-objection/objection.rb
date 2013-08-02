module Objection
  def self.included(base)
    base.send :extend, ClassMethods
  end

  def self.injector(*modules)
    if modules.empty?
      JSObjection.createInjector
    elsif modules.size == 1
      JSObjection.createInjector modules.first
    else
      JSObjection.createInjectorWithModules *modules
    end
  end

  module ClassMethods
    def objectionRequires(*args)
      @_dependencies || Set.new
    end

    def compose_with(*args)
      args.each { |x| attr_accessor x }
      @_dependencies = NSSet.setWithArray(args.map(&:to_s))
    end

    def singleton
      JSObjection.registerClass self, scope: JSObjectionScopeSingleton 
    end
  end
end
