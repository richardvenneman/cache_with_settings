require "cache_with_settings/railtie"
require "money-rails"

module CacheWithSettings
  module Helpers
    def cache(key, options = {}, &block)
      super(cache_with_settings_compose_key(key), options) do
        yield(block)
      end
    end

    private
    def cache_with_settings_compose_key(key)
      Array.wrap(key).concat([I18n.locale.to_s, MoneyRails.default_currency.to_s])
    end
  end
end
