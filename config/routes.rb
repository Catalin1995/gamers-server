Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do

    resources :users, only: [:index, :show, :create] do
      resources :globalchat, only: [:index, :create]
    end
    resources :feed, only: [:index, :show, :create]
    put '/login', to: 'users#login'
    # resources :chat, only: [:create]
    resources :games, only: [:index, :show]
    resources :games, only: [:show] do
      resources :gamefeeds, only: [:index]
    end
  end

  # delete '/logout', to: 'users#logout'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # get "/*path" => redirect("/?goto=%{path}")

  # root 'games#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
