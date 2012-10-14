SoMuchSports::Application.routes.draw do
  # get "games/index"
  resources :games, :only => [:index, :show]
end
