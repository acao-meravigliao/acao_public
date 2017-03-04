Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true

  config.assets.debug = false

  config.assets.digest = true

  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  config.extgui.ext_core_js = 'ext/ext-dev.js'
  config.extgui.hel_host = 'http://[::1]:3330'

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
    'video.js',
    'video.css',
    'radar.css',
    'radar-all.js',
    'meteo.js',
  ]
end
