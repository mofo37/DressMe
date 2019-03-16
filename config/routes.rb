Rails.application.routes.draw do
  root to: 'photos#index'
  get 'signup',  to: 'users#new',        as: 'signup'
  get 'signin',  to: 'sessions#new',     as: 'signin'
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

  resources :outfits do
    member do
    delete "delete_image/:image_id", action: :delete_image, as: 'delete_image'
    end
  end
end
