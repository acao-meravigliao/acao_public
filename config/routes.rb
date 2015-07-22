Acao::Application.routes.draw do
  get 'meteosat' => 'meteosat#get'

  get 'player' => 'main#player'
  get 'live' => 'main#live'

  get 'video/:mediaid' => 'main#video'
  get 'embed/:mediaid' => 'main#embed'

  get 'cam/:name' => 'cam#live'
  get 'cam/:name/live' => 'cam#live'
  get 'cam/:name/livelapse' => 'cam#livelapse'
  get 'cam/:name/player' => 'cam#player'

  get 'radar' => 'radar#main'
  get 'radar/embed' => 'radar#embed'

  get 'meteo' => 'meteo#main'

  get 'services' => 'extgui/main#index'

  root :to => 'radar#main'

  namespace :ygg do
    namespace :acao do
      hel_resources :flights do
      end

      hel_resources :planes do
        collection do
          get 'by_code/:id(.:format)' => :by_code
        end
      end
    end
  end
end
