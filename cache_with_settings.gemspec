# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "cache_with_settings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cache_with_settings"
  s.version     = CacheWithSettings::VERSION
  s.authors     = ["Richard Venneman"]
  s.email       = ["richardvenneman@me.com"]
  s.homepage    = "https://github.com/richardvenneman"
  s.summary     = "Automatic fragment caching in Rails with locales"
  s.description = "Automatically add application locale (I18n.locale) as a part of cache key in Rails views."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"
  s.add_dependency "money-rails"

  s.add_development_dependency "rubocop", "< 0.68"
  s.add_development_dependency "rubocop-rails_config"
  s.add_development_dependency "sqlite3"
end
