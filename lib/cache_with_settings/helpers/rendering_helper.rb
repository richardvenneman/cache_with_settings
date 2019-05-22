# frozen_string_literal: true

module CacheWithSettings::Helpers
  module RenderingHelper
    def render(options = {}, locals = {}, &block)
      if options.kind_of?(Hash) && options[:cached] == true
        options[:cached] = -> object { CacheWithSettings.compose_key(object) }
      end

      if block_given?
        super(options, locals) { yield(block) }
      else
        super(options, locals)
      end
    end
  end
end
