# frozen_string_literal: true

require "cache_with_settings/configuration"
require "cache_with_settings/helpers/cache_helper"
require "cache_with_settings/helpers/rendering_helper"
require "cache_with_settings/railtie"

module CacheWithSettings
  module Helpers
  end

  def self.compose_key(key)
    Array.wrap(key).concat(CacheWithSettings.cache_keys.call)
  end
end
