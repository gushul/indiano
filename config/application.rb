require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Indiano
  class Application < Rails::Application
    config.exception_app = self.routes

    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.test_framework false
    end
  end
end
