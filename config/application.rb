require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AngularTodoList
  class Application < Rails::Application

    config.time_zone = 'Kyiv'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true


    #omniauth neaded session
    # config.middleware.use Rack::MethodOverride
    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore
    # config.middleware.use ActionDispatch::Flash

    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper = false

    config.assets.paths << Rails.root.join("vendor","assets","bower_components")

    # config.angular_templates.htmlcompressor = true

  end
end
