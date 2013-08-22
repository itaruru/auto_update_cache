$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "auto_update_cache/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "auto_update_cache"
  s.version     = AutoUpdateCache::VERSION
  s.authors     = ["Tomoyuki Tarumi"]
  s.email       = ["tarumitomoyuki@gmail.com"]
  s.homepage    = ""
  s.summary     = " Summary of AutoUpdateCache."
  s.description = " Description of AutoUpdateCache."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 4.0.0'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'pry-nav'
  s.add_development_dependency 'pry-stack_explorer'
end
