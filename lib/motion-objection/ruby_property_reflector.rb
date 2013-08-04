class RubyPropertyReflector
  NAMESPACE_SEPARTOR = "/"
  
  def self.propertyForClass(klass, andProperty: property)
    scopes = klass.send(:objectionTypeMappings)[property].to_s.split(NAMESPACE_SEPARTOR).map { |x| x.split("_") }.map { |x| x.map { |y| y.capitalize }.join("") }
    klass = scopes.inject(Object) do |const, name|
      const.const_get name
    end
    JSObjectionPropertyInfo.new(klass, JSObjectionTypeClass).value
  end
end
