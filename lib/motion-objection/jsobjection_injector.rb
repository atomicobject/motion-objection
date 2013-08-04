class JSObjectionInjector
  alias_method :[], :getObject

  def get_object(klass, *args)
    if args.empty?
      getObject klass
    else
      getObjectWithArgs klass, *args
    end
  end
end
