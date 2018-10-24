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

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  config.core.amqp_may_fail = true

  config.amqp_ws_gw.routes.merge!({
    'ygg.glideradar.processed_traffic.linobis': {
      type: :topic,
      durable: true,
      auto_delete: false,
      anonymous_access: true,
    }
  })

end
