Rails.application.routes.draw do
  
  devise_for :users
  resources :charges 
  resources :events  
  
  
  
  resources :users
  resources :attendances
  root "events#index"
  
  
end
