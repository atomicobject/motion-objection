class RubyPropertyReflector < JSObjectionRuntimePropertyReflector
  def propertyForClass(klass, andProperty: property)
    if klass.respondsToSelector :objectionTypeMappings
      dependency_type = klass.send(:objectionTypeMappings)[property]
      unless dependency_type.is_a? Class
        dependency_type = dependency_type.objection_constantize
      end
      property_info = JSObjectionPropertyInfo.new
      property_info.value = dependency_type
      property_info.type = JSObjectionTypeClass
      property_info
    else
      super
    end
  end
end
