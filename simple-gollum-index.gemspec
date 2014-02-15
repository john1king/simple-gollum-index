Gem::Specification.new do |s|
  s.name        = 'simple-gollum-index'
  s.summary     = "A simple index for gollum wiki."
  s.description = "A simple index for gollum wiki use page h1 title."
  s.version     = '0.0.1'
  s.date        = '2014-02-15'
  s.license     = 'MIT'
  s.authors     = ["John King"]
  s.email       = 'uifantasy@gmail.com'
  s.homepage    = 'https://github.com/john1king/simple-gollum-index'
  s.files       = Dir['lib/**/*']
  s.add_dependency('gollum', '~> 2.6')
end
