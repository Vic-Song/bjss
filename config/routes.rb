Rails.application.routes.draw do
  resources :histories
  get 'search/index'

  resources :records
  resources :reviews
  get 'landing/front' => 'landing#front'

  devise_for :users
  resources :replies
  resources :posts
  resources :comments
  resources :videos
  resources :chapters
  resources :courses
  get 'home/index'  => 'home#index'
  
  root 'landing#front'

  get 'home/admin'

  get 'home/about'
  get 'home/userpanel'

     namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
      resources  :reviews, :records,:users
      get 'records/show'
       end
    end

    resources :videos  do
      member do 
        get 'download'
      end
    end

   get '*path', to: 'home#routing_error'

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
