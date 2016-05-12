Rails.application.routes.draw do
  resources :cocktails,   only: [:index, :show], param: :name do
    member do
      put    :like
      delete :unlike
    end
  end
  resources :feeds,       only: [:index]
  resources :ingredients, only: [:index]
  resources :posts do
    resources :comments,  only: [:create, :update, :destroy]
  end
  resources :users,       only: [:index, :show], param: :name do
    member do
      put    :update_inventory
      put    :follow
      delete :unfollow
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth'
end
