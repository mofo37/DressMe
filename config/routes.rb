Rails.application.routes.draw do
  root to: 'greetings#welcome'
  
  resources :photos
  resources :pieces
  resources :outfits
end
