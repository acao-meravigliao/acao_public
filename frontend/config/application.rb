require_relative 'boot'

require 'rails'
require 'action_controller/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AcaoPublicFrontend
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

    config.app_version = /releases\/([0-9]+)/.match(File.expand_path(__dir__)) ? "rel-#{$1}" : (
                           `git describe --tags --dirty --long` || `git rev-parse HEAD`).chop

    config.extgui.page_title = 'ACAO Area Servizi'
    config.extgui.application = 'AcaoPublic.Application'
    config.extgui.routes.merge!({ 'AcaoPublic' => 'AcaoPublic' })
    config.extgui.default_theme = :neptune
    config.extgui.main_css = 'acao_public.css'
    config.extgui.favicon = 'acao_public/favicon.png'
    config.extgui.extra_config = {
      airbrake: {
        host: 'https://errbit.sevio.it',
        project_id: 1,
        project_key: 'b2fb648d65f08fcb01cceb6eb2dc3f79',
      },
    }
  end
end
