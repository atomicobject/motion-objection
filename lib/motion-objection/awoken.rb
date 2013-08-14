module Objection
  module Awoken
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
    end

    module InstanceMethods
      def awakeFromObjection
        # self.send :awoke_from_objection if self.respond_to? :awoke_from_objection
        if self.class._incantations
          self.class._incantations.each do |proc|
            instance_eval &proc
          end
        end
      end
    end
    
    module ClassMethods
      attr_reader :_incantations
      def awoken(&block)
        @_incantations ||= []
        @_incantations << block
      end
    end
  end
end
