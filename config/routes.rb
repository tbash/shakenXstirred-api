Rails.application.routes.draw do
  # Not giving access via http to
  # cocktails/ingredients for now
  resources :users,       only: [:index, :show]
  resources :cocktails,   only: [:index, :show]
  resources :ingredients, only: [:index, :show]
  mount_devise_token_auth_for 'User', at: 'auth'

  get  '/feed',             to: 'feeds#index'
  post '/update_inventory', to: 'users#update_inventory'
  post '/users/:id/follow', to: 'users#follow'
end
