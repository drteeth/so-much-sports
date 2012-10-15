SoMuchSports::Application.routes.draw do
  resources :games, :only => [:index, :show]

  resources :sports do
    resources :periods do
      resources :games do
      end
    end
  end

  resources :teams, :only => [:index, :show]

end
