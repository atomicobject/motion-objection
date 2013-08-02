# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "motion-cocoapods"

$:.unshift("./lib/")
require './lib/motion-objection'
require './lib/motion-objection/objection_property_reflector.rb'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-objection'
  app.pods do 
    pod "Objection", path: "../objection"
  end
end
