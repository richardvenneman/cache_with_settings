# frozen_string_literal: true

require "test_helper"

class CacheWithSettings::Test < ActiveSupport::TestCase
  include CacheWithSettings::Helpers

  test "truth" do
    assert_kind_of Module, CacheWithSettings
  end

  test "helper" do
    assert_equal ["x", "nl", "EUR"], CacheWithSettings.compose_key("x")
  end
end
