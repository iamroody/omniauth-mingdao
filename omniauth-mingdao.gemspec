# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-mingdao/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "Yan Wang"
  gem.email         = "wangyan87@gmail.com"
  gem.description   = %q{OmniAuth Oauth2 strategy for mingdo.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for mingdao.}
  gem.homepage      = "https://github.com/iamroody/omniauth-mingdao"
  
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-mingdao"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Mingdao::VERSION
  gem.license       = 'MIT'
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
