Rails.application.routes.draw do
  
  devise_for :users
  resources :charges 
  resources :events do 
    resources :attendances
  end  
  
  
  
  resources :users
  resources :attendances
  root "events#index"
  
  
end
