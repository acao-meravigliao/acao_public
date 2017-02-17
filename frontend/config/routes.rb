Rails.application.routes.draw do

  get 'services' => 'extgui/main#index'

  get 'meteosat' => 'meteosat#get'

  get 'player' => 'main#player'
  get 'live' => 'main#live'

  get 'video/:mediaid' => 'main#video'
  get 'embed/:mediaid' => 'main#embed'

  scope module: 'ygg/acao' do
    get 'radar' => 'radar#main'
    get 'radar/embed' => 'radar#embed'
    get 'meteo' => 'meteo#main'
  end

  scope module: 'ygg/streaming' do
    get 'cam/:name' => 'player#live'
    get 'cam/:name/live.m3u8' => 'player#live_m3u8'
    get 'cam/:name/live' => 'player#live'
    get 'cam/:name/livelapse' => 'player#livelapse'
    get 'cam/:name/player' => 'player#player'
  end
end
