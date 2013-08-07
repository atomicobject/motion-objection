class RubyPropertyReflector
  
  def self.propertyForClass(klass, andProperty: property)
    dependency_type = klass.send(:objectionTypeMappings)[property]
    unless dependency_type.is_a? Class
      dependency_type = dependency_type.objection_constantize
    end
    JSObjectionPropertyInfo.new(dependency_type, JSObjectionTypeClass).value
  end

end
