Acao::Application.routes.draw do
  get 'meteosat' => 'meteosat#get'

  get 'player' => 'main#player'
  get 'live' => 'main#live'

  get 'video/:mediaid' => 'main#video'
  get 'embed/:mediaid' => 'main#embed'

  get 'radar' => 'radar#main'

  get 'services' => 'extgui/main#index'

  root :to => 'main#player'

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
