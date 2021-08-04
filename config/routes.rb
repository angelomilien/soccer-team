Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
    root 'sessions#home'
    get '/signup', to: 'sessions#signup'
    post '/signup', to: 'users#signup'
    get '/login', to: 'sessions#login'
    post '/login', to: 'users#login'
    delete '/logout', to: 'sessions#logout'

    resources :players
    resources :teams
    resources :countries
    resources :users
    # get 'about', to: 'static#about'
  # resources :posts, only: [:index, :show, :new, :create, :edit, :update]
end
