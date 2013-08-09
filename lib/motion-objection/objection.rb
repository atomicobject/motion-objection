module Objection
  module_function

  def injector(*modules)
    if modules.empty?
      JSObjection.createInjector
    elsif modules.size == 1
      JSObjection.createInjector modules.first
    else
      JSObjection.createInjectorWithModulesArray modules
    end
  end

  def default_injector=(injector)
    JSObjection.setDefaultInjector injector
  end

  def default_injector
    JSObjection.defaultInjector
  end
end
