$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "promotion/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "promotion"
  s.version     = Promotion::VERSION
  s.authors     = ["Scott Mason"]
  s.email       = ["scott@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk/"
  s.summary     = "Rails ActiveAdmin backed engine to provide promotional website content of pre-defined types."
  s.description = "Promotion provides a number of pre-defined content types such as text, image and video that are useful to use as promotional content across a website."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "paperclip", "~> 3.0"
  s.add_dependency "globalize3", "0.3.0"
  s.add_dependency "activeadmin-globalize3", "0.0.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
