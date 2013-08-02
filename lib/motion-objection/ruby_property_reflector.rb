class RubyPropertyReflector
  NAMESPACE_SEPARTOR = "/"
  
  def self.propertyForClass(klass, andProperty: property)
    class_name = property.to_s.split(NAMESPACE_SEPARTOR).map { |x| x.split("_") }.map { |x| x.map { |y| y.capitalize }.join("") }.join("::")
    constant = Object.const_get class_name
    pointer = Pointer.new :object
    pointer[0] = constant
    JSObjectionPropertyInfo.new(pointer, JSObjectionTypeClass)
  end
end
