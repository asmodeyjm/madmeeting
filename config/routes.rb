Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'games#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
end

  get 'welcome/index'
  
  resources :games do
    member do
      get :join
      get :set_options
    end
  end
  resources :options, only: [:create, :destroy]
  # get 'games, to: 'games#create'

  # get '/patients/:id', to: 'patients#show', as: 'patient' 

  # root 'frank#index' RIP: 12-11-14
  
end

