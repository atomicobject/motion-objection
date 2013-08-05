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
      JSObjection.createInjectorWithModulesArray modules
    end
  end

  module Initializer
    def objectionInitializer
      @_initializer
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

    def initializer(selector, *args)
      self.send :extend, Initializer 
      @_initializer = {
        "initializer" => selector,
        "arguments" => args
      }
    end

    protected 

    def objectionRequires
      @_dependencies ||= NSSet.set
      if self.superclass.respondsToSelector :objectionRequires
        set = NSMutableSet.setWithSet self.superclass.objectionRequires
        set.unionSet @_dependencies
        set
      else
        @_dependencies
      end
    end

    def objectionTypeMappings
      @_types_mappings ||= {}
      if self.superclass.respondsToSelector :objectionTypeMappings
        @_types_mappings.merge self.superclass.objectionTypeMappings
      else
        @_types_mappings
      end
    end
  end
end
