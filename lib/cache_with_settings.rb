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
      Array.wrap(key) + [I18n.locale.to_s]
    end
  end
end
