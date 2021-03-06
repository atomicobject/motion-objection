module Objection
  module Compose
    def self.included(base) #:nodoc:
      base.send :extend, ClassMethods
    end

    module Initializer #:nodoc:
      def objectionInitializer
        @_initializer
      end
    end

    module ClassMethods

      def compose_with(*args)
        @_type_mappings = {}
        properties = []
        args.each do |arg|
          if arg.is_a? Hash
            arg.each do |k,v|
              @_type_mappings[k.to_s] = v
              attr_accessor k
              properties << k
            end
          else
            prop = arg.split("/").last
            attr_accessor prop
            @_type_mappings[prop] = arg.to_s
            properties << prop
          end
        end
        @_dependencies = NSSet.setWithArray(properties.map(&:to_s))
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
        @_type_mappings ||= {}
        if self.superclass.respondsToSelector :objectionTypeMappings
          @_type_mappings.merge self.superclass.objectionTypeMappings
        else
          @_type_mappings
        end
      end
    end
  end
end
