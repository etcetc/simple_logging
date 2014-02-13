$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_logging"
  s.version     = SimpleLogging::VERSION
  s.authors     = ["Farhd Farzaneh"]
  s.email       = ["ff@onebeat.com"]
  s.homepage    = ""
  s.summary     = "A very simple gem to allow creating separate log files."
  s.description = "Makes it easy to create a separate log file"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rspec", "~> 2.6"

end
