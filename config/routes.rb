Rails.application.routes.draw do
  
  devise_for :users
  resources :charges 
  resources :events do 
    resources :attendances
    resources :avatars, only: [:create]
  end  
  
  
  
  resources :users, only: [:show] do
    resources :profils, only: [:create]
  end
  root "events#index"
  
  
end
