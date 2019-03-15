Rails.application.routes.draw do
  root to: 'photos#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :tags, only: [:index, :show]
  resources :wishlists
  resources :users
  resources :pieces
  resources :photos, only: :index
  resources :outfits
  resources :sessions

  resources :pieces do
    member do
    delete "delete_image/:image_id", action: :delete_image, as: 'delete_image'
    end
  end
end
