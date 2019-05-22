# frozen_string_literal: true

module CacheWithSettings::Helpers
  module CacheHelper
    def cache(key, options = {}, &block)
      super(CacheWithSettings.compose_key(key), options) do
        yield(block)
      end
    end
  end
end
