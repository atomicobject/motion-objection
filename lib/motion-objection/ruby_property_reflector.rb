class RubyPropertyReflector
  NAMESPACE_SEPARTOR = "/"
  
  def self.propertyForClass(klass, andProperty: property)
    mapping = klass.send(:objectionTypeMappings)[property]
    if mapping.is_a? Class
      dependency_type = mapping
    else
      scopes = klass.send(:objectionTypeMappings)[property].to_s.split(NAMESPACE_SEPARTOR).map { |x| x.split("_") }.map { |x| x.map { |y| y.capitalize }.join("") }
      dependency_type = scopes.inject(Object) do |const, name|
        const.const_get name
      end
    end
    JSObjectionPropertyInfo.new(dependency_type, JSObjectionTypeClass).value
  end
end
