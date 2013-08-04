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

    def compose_with(*args)
      props = args.map { |x| x.split("/").last }
      props.each { |x| attr_accessor x }
      @_types_mappings = {}
      props.each_index { |i| @_types_mappings[props[i]] = args[i] }
      @_dependencies = NSSet.setWithArray(props.map(&:to_s))
    end

    def singleton
      JSObjection.registerClass self, scope: JSObjectionScopeSingleton 
    end

    protected 

    def objectionRequires
      @_dependencies || NSSet.new
    end

    def objectionTypeMappings
      @_types_mappings || {}
    end
  end
end
