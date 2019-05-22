# frozen_string_literal: true

module CacheWithSettings
  class Railtie < ::Rails::Railtie
    initializer "cache_with_settings.helpers" do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, CacheWithSettings::Helpers::CacheHelper
        ActionView::Base.send :include, CacheWithSettings::Helpers::RenderingHelper
      end
    end
  end
end
