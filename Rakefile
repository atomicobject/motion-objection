# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "motion-cocoapods"

$:.unshift("./lib/")
require './lib/motion-objection'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-objection'

  app.identifier = 'com.atomicobject.motion-objection'

  app.pods do 
    pod "Objection", "~>1.0.3"
  end
end
