desc 'Builds Extgui asset indexes'
task :extgui_assets do
  # Start puma (hel+asgard) if not running already?

  sh 'phantomjs ../../yggdra/tools/extgui_assets.js' +
       ' app/assets/js/acao_public-stage1-files.js' +
       ' app/assets/js/acao_public-stage2-files.js' +
       ' http://localhost:3101/services'
end
