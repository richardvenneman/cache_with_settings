# frozen_string_literal: true

require "cache_with_settings/configuration"
require "cache_with_settings/railtie"

module CacheWithSettings
  module Helpers
    def cache(key, options = {}, &block)
      super(cache_with_settings_compose_key(key), options) do
        yield(block)
      end
    end

    private
      def cache_with_settings_compose_key(key)
        Array.wrap(key).concat(CacheWithSettings.cache_keys)
      end
  end
end
