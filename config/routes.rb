Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  
  resources :games do
    member do
      get :join
    end
  end
  resources :options, only: [:create, :destroy]
  # get 'games, to: 'games#create'

  # get '/patients/:id', to: 'patients#show', as: 'patient' 

  root 'frank#index'
  
end
