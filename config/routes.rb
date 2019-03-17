Rails.application.routes.draw do
  # Signed in homepage
  root to: 'pieces#index'

  get 'signup',  to: 'users#new',        as: 'signup'
  get 'signin',  to: 'sessions#new',     as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :tags, only: [:index, :show]
  resources :wishlists
  resources :users
  resources :outfits
  resources :sessions

  resources :pieces, except: [:index] do
    member do
      delete "delete_image/:image_id", action: :delete_image, as: 'delete_image'
    end
  end

  get 'pieces', to: redirect('/')

  resources :outfits do
    member do
      delete "delete_image/:image_id", action: :delete_image, as: 'delete_image'
    end
  end
end
