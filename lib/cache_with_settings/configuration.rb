# frozen_string_literal: true

module CacheWithSettings
  mattr_accessor :cache_keys
  self.cache_keys = -> { [] }

  def self.configure
    yield self
  end
end
