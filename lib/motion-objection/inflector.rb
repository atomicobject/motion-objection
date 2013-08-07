module Objection
  module Inflector
    NAMESPACE_SEPARTOR = "/"

    def self.included(base)
      base.send :include, InstanceMethods
    end

    def self.constantize(string)
      scopes = string.split(NAMESPACE_SEPARTOR).map { |x| x.split("_") }.map { |x| x.map { |y| y.capitalize }.join("") }
      scopes.inject(Object) do |const, name|
        const.const_get name
      end
    end

    module InstanceMethods
      def objection_constantize
        Inflector.constantize(self)
      end
    end
  end
end
