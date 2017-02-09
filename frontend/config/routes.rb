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

    get 'cam/:name' => 'cam#live'
    get 'cam/:name/live.m3u8' => 'cam#live_m3u8'
    get 'cam/:name/live' => 'cam#live'
    get 'cam/:name/livelapse' => 'cam#livelapse'
    get 'cam/:name/player' => 'cam#player'
  end
end
