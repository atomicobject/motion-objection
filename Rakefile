# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "motion-cocoapods"

$:.unshift("./lib/")
require './lib/motion-objection'

Motion::Project::App.setup do |app|
  app.name = 'motion-objection'

  if ENV['DEV_CERT']
    app.codesign_certificate = ENV['DEV_CERT']
  end
  app.identifier = 'com.atomicobject.motion-objection'

  app.pods do 
    pod "Objection", '~>1.2'
  end
end
