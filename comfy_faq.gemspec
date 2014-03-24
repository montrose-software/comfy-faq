$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'comfy_faq/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'comfy_faq'
  s.version     = ComfyFaq::VERSION
  s.authors     = ['Tomasz Pajor', 'Montrose Software LLC']
  s.email       = ['n@servercrunch.com']
  s.homepage    = 'http://github.com/montrose-software/comfy-faq'
  s.summary     = 'Faq Engine for ComfortableMexicanSofa'
  s.description = 'Faq Engine for ComfortableMexicanSofa'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.add_dependency 'comfortable_mexican_sofa', '>= 1.8', '< 1.9'
  s.add_dependency 'acts_as_list'
end
