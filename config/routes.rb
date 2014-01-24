Acao::Application.routes.draw do
  get 'meteosat' => 'meteosat#get'

  get 'player' => 'main#player'
  get 'live' => 'main#live'

  get 'video/:mediaid' => 'main#video'
  get 'embed/:mediaid' => 'main#embed'

  get 'radar' => 'radar#main'

  get 'services' => 'services/main#index'

  root :to => 'main#player'
end
