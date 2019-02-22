Rails.application.routes.draw do
  root to: 'photos#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :wishlists
  resources :users
  resources :pieces
  resources :photos, only: :index
  resources :outfits
  resources :sessions
end
