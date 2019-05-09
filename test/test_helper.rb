# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)

require "rails/test_help"

puts "USING Rails: #{Gem.loaded_specs['rails'].version}"

Minitest.backtrace_filter = Minitest::BacktraceFilter.new

CacheWithSettings.configure do |config|
  config.cache_keys = -> { [I18n.locale.to_s, "EUR"] }
end
