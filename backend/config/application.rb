require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require 'ygg/i18n/backend'
I18n.backend = Ygg::I18n::Backend.new

require 'socket'

module Acao
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Europe/Rome'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Version of your assets, change this if you want to expire all your assets.
    config.assets.version = '1.0'

    config.assets.paths << File.join(Rails.root, 'app', 'assets', 'js')
    config.assets.paths << File.join(Rails.root, 'app', 'assets', 'css')

    config.rails_amqp.url = 'amqp://agent@lino.acao.it'
    config.rails_amqp.debug = 0

    config.amqp_ws_gw.authentication_needed = false

    config.amqp_ws_gw.routes = {
      'ygg.glideradar.processed_traffic': {
        exchange_type: :topic,
        exchange_options: {
          durable: true,
          auto_delete: false,
        },
        routing_key: '#',
        queue_name: 'ygg.glideradar.processed_traffic.backend.' + Socket.gethostname,
        queue_options: {
          durable: false,
          auto_delete: true,
          arguments: {
            'x-message-ttl': 30000,
          },
        },
      },
      'ygg.meteo.updates': {
        exchange_type: :topic,
        exchange_options: {
          durable: true,
          auto_delete: false,
        },
        routing_key: '#',
        queue_name: 'ygg.meteo.updates.backend.' + Socket.gethostname,
        queue_options: {
          durable: false,
          auto_delete: true,
          arguments: {
            'x-message-ttl': 30000,
          },
        },
      },
    }

    config.amqp_ws_gw.allowed_request_origins = [
      'https://acao.it',
      'http://linobis.acao.it:3000',
      'http://linobis.acao.it:3101',
    ]
  end
end
