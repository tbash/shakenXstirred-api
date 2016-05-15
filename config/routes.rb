Rails.application.routes.draw do
  constraints subdomain: "api" do
    namespace :api, path: nil do
      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        resources :cocktails,   only: [:index, :show], param: :name do
          member do
            put    :save
            delete :unsave
          end
        end
        resources :ingredients, only: [:index]
        resources :users,       only: [:index, :show], param: :name do
          member do
            put    :update_inventory
          end
        end

        mount_devise_token_auth_for 'User', at: 'auth'
      end

      scope module: :v2, constraints: ApiConstraints.new(version: 2) do
        resources :cocktails,   only: [:index, :show], param: :name do
          member do
            put    :save
            delete :unsave
          end
        end
        resources :ingredients, only: [:index]
        resources :posts do
          member do
            put    :like
            delete :unlike
          end
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
    end
  end
end
