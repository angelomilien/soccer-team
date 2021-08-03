Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
    root 'session#home'
    get 'signup', to: 'session#signup'
    get 'login', to: 'session#login'
    post 'login', to: 'session#create'
    resources :players
    resources :teams
    resources :countries
    resources :users
    # get 'about', to: 'static#about'
  # resources :posts, only: [:index, :show, :new, :create, :edit, :update]
end
