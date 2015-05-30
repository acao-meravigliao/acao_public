Acao::Application.configure do
  config.eager_load = true

  config.assets.debug = false

  config.assets.digest = true

  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  config.extgui.hel_host = '127.0.0.1:3100'

  config.assets.precompile += [
    /\w+\.(?!js|css)$/,
    'acao_services.css',
    'acao_services-stage1.js',
    'acao_services-stage2.js',
    'ext/ext.js',
    'ext/ext-theme-neptune.js',
    'ext/resources/ext-theme-classic/ext-theme-classic-all.css',
    'ext/resources/ext-theme-gray/ext-theme-gray-all.css',
    'ext/resources/ext-theme-access/ext-theme-access-all.css',
    'ext/resources/ext-theme-neptune/ext-theme-neptune-all.css',
    'ext/resources/ext-theme-redtune/ext-theme-redtune-all.css',
    'radar.js',
    'meteo.js',
  ]
end
