Rails.application.routes.draw do

  root to: "home#index"
  resources :maps
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  resources :favorites
  get '/about', to: 'maps#about'

  post '/burritos', to: 'maps#find_burritos'

  namespace :api do
    namespace :v1 do
      resources :burritos, only: [:index]
    end
  end
end
