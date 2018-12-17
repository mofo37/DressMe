Rails.application.routes.draw do
  root to: 'greetings#welcome'
  
  resources :users
  resources :photos
  resources :pieces
  resources :outfits
end
