require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'devise'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Hazbun
  class Application < Rails::Application
    
    config.generators do |g|
        g.test_framework :rspec,
            fixtures: true,
            view_specs: false, 
            helper_specs: false,
            routing_specs: false,
            controller_specs: true,
            request_specs: true
        g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.i18n.enforce_available_locales = true
    config.autoload_paths += %W(#{config.root}/lib)

  end
end
