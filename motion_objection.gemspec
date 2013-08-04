require File.expand_path('../lib/motion-objection/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'motion-objection'
  gem.version       = Objection::VERSION
  gem.licenses      = ['MIT']

  gem.authors  = ['dewind']

  gem.description = <<-DESC
  motion-objection is a wrapper around Objection which is a dependency
  injection framework writtent for Objective-C
DESC

  gem.summary = 'A ruby motion library wrapping the popular dependency injection library Objection'
  gem.homepage = 'https://github.com/atomicobject/motion-objection'

  gem.files       = `git ls-files`.split($\)
  gem.require_paths = ['lib']
  gem.test_files  = gem.files.grep(%r{^spec/})
  gem.add_dependency "motion-cocoapods", "~>1.3.5"
end
