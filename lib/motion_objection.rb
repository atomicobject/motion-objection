unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion_objection/*.rb')).each do |file|
    app.files.unshift(file)
  end

  app.pods do
    pod 'Objection'
  end
  # app.vendor_project(File.expand_path(File.join(File.dirname(__FILE__), '../vendor/native-foo')), :static)
  # app.frameworks += ['CoreData']
end
