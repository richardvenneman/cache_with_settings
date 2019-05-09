require 'test_helper'

class CacheWithSettings::Test < ActiveSupport::TestCase
  include CacheWithSettings::Helpers

  test "truth" do
    assert_kind_of Module, CacheWithSettings
  end

  test "helper" do
    assert_equal send(:cache_with_settings_compose_key, 'x'), ['x', 'uk', 'USD']
  end
end
