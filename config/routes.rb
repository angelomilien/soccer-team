Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
    root 'sessions#home'
    get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#signup'

    get '/login', to: 'sessions#login'
    post '/signing', to: 'sessions#signing'

    delete '/logout', to: 'sessions#logout'
    # get'/logout', to: 'sessions#logout'  #handling get logout from users

    resources :players
    resources :teams
    resources :countries
    resources :users
    # get 'about', to: 'static#about'
  # resources :posts, only: [:index, :show, :new, :create, :edit, :update, :delete]
end
