$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'comfy_faq/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'comfy_faq'
  s.version     = ComfyFaq::VERSION
  s.authors     = ['Tomasz Pajor', 'Montrose Software LLC']
  s.email       = ['janusz.mordarski@montrosesoftware.com']
  s.homepage    = 'http://github.com/montrose-software/comfy-faq'
  s.summary     = 'FAQ Engine for ComfortableMexicanSofa'
  s.description = 'FAQ Engine for ComfortableMexicanSofa'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.add_dependency 'comfortable_mexican_sofa', '>= 1.12.7'
  s.add_dependency 'acts_as_list'
end
