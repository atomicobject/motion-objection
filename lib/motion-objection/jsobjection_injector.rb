class JSObjectionInjector
  alias_method :[], :getObject
  alias_method :inject_dependencies, :injectDependencies
  alias_method :with_module, :withModule
  alias_method :without_module_of_type, :withoutModuleOfType

  def get_object(klass, *args)
    if args.empty?
      getObject klass
    else
      getObject klass, argumentList: args
    end
  end

  def with_modules(*modules)
    withModuleCollection modules
  end

  def without_modules_of_type(*modules)
    withoutModuleCollection modules
  end
end
