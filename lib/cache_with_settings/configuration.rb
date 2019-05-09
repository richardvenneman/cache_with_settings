module CacheWithSettings
  mattr_accessor :cache_keys
  self.cache_keys = []

  def self.configure
    yield self
  end
end
