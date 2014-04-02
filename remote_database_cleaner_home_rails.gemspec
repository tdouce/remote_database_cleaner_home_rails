$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "remote_database_cleaner_home_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "remote_database_cleaner_home_rails"
  s.version     = RemoteDatabaseCleanerHomeRails::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RemoteDatabaseCleanerHomeRails."
  s.description = "TODO: Description of RemoteDatabaseCleanerHomeRails."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.4"

  s.add_development_dependency "sqlite3"
end
