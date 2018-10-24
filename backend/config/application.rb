require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

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

    config.app_version = /releases\/([0-9]+)/.match(File.expand_path(__dir__)) ? "rel-#{$1}" : (
                           `git describe --tags --dirty --long` || `git rev-parse HEAD`).chop

    config.rails_amqp.url = 'amqp://agent@iserver.acao.it'
    config.rails_amqp.debug = 0

    config.amqp_ws_gw.authentication_needed = false
    config.amqp_ws_gw.debug = 3

    config.amqp_ws_gw.shared_queue = {
      name: 'ygg.acao_public.' + Socket.gethostname,
      durable: false,
      auto_delete: true,
      arguments: {
        'x-message-ttl': 30000,
      },
    }

    config.amqp_ws_gw.routes = {
      'ygg.meteo.updates': {
        type: :topic,
        durable: true,
        auto_delete: false,
        anonymous_access: true,
      },
    }

    config.amqp_ws_gw.allowed_request_origins = [
      'https://acao.it',
      'http://linobis.acao.it:3000',
      'http://linobis.acao.it:3100',
      'http://linobis.acao.it:3101',
      'http://linobis.acao.it:4200',
    ]
  end
end
