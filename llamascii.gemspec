require './lib/llamascii/version'

Gem::Specification.new do |s|
  s.name        = 'llamascii'
  s.version     = Llamascii::VERSION
  s.summary     = "Llamascii"
  s.description = "Do llamas, add ascii"
  s.authors     = ["Carl Furrow"]
  s.email       = 'me@carlfurrow.com'
  s.files       = Dir["{lib}/**/*"] + ["README.md"]
  s.executables << "llamascii"
  s.homepage    = 'http://carlfurrow.com'
  s.license     = 'MIT'

  s.add_dependency 'actionview', '~> 4.1.0'
end
