require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

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

    config.assets.paths << File.join(Rails.root, 'app', 'assets', 'js')
    config.assets.paths << File.join(Rails.root, 'app', 'assets', 'css')

    config.extgui.page_title = 'ACAO Area Servizi'
    config.extgui.main_js = 'acao-stage1'
    config.extgui.stage2_js = 'acao-stage2'
    config.extgui.main_app_prefix = 'Acao'
    config.extgui.routes = { 'Acao' => '/assets/acao' }
    config.extgui.ext_asset = 'ext/ext'
    config.extgui.main_css = 'services'
    config.extgui.favicon = 'acao/favicon.png'
  end
end
