Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  config.assets.debug = true

  config.assets.raise_production_errors = true

  # Avoid having precompiled assets being served
  config.assets.prefix = '/assets-dev'

  config.extgui.compile_trees << 'AcaoPublic'

  config.extgui.ext_core_js = 'ext/ext-dev.js'
  config.extgui.hel_host = 'http://[::1]:3330'

  config.extgui.faye_source_uri = lambda { "#{request.protocol}#{request.host}:8000/faye/faye.js" }
  config.extgui.faye_interface_uri = lambda { "#{request.protocol}#{request.host}:8000/faye" }

  require ::File.expand_path('../../../lib/proxy',  __FILE__)
  config.middleware.use Rack::Proxy do |req|
    if req.path =~ %r{^/ygg/(.*)}
      URI.parse("#{Rails.application.config.extgui.hel_host}/ygg/#{$1}?#{req.query_string}")
    end
  end
end
