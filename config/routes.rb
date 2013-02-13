SoMuchSports::Application.routes.draw do
  resources :sports, only: [:index]
  get '/sync' => 'sports#sync', as: :sync, format: :json
  get '/sync/:since' => 'sports#sync_since', as: :sync, format: :json

  root to: 'app#backbone'
end
