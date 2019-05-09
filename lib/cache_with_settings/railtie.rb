# frozen_string_literal: true

module CacheWithSettings
  class Railtie < ::Rails::Railtie
    initializer "rails_db.helpers" do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, CacheWithSettings::Helpers
      end
    end
  end
end
