Rails.application.routes.draw do
  resources :users,       only: [:index, :show] do
    member do
      post :update_inventory
      get  :follow
      get  :unfollow
    end
  end
  resources :cocktails,   only: [:index, :show]
  resources :ingredients, only: [:index, :show]
  get  '/feed',             to: 'feeds#index'

  mount_devise_token_auth_for 'User', at: 'auth'
end
