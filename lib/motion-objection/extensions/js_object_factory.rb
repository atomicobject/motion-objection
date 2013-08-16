class JSObjectFactory
  alias_method :[], :getObject

  def get_object(klass, *args)
    if args.empty?
      getObject klass
    else
      getObject klass, withArgumentList: args
    end
  end
end
