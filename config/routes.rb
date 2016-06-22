Rails.application.routes.draw do
  # 认证
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  # 控制器
  get '/download' => 'download#index'
  get '/study' => 'study#index'

  # 资源
  get '/topics/essence', to: 'topics#essence', as: 'essence_topic'
  get '/topics/ask', to: 'topics#ask', as: 'ask_topic'
  get '/topics/share', to: 'topics#share', as: 'share_topic'
  get '/topics/other', to: 'topics#other', as: 'other_topic'
  get '/topics/:id/userpub', to: 'topics#user_pub', as: 'user_pub_topic'
  get '/topics/:id/userreply', to: 'topics#user_reply', as: 'user_reply_topic'
  get '/topics/:id/like', to: 'topics#like', as: 'like_topic'   # 点赞
  resources :topics do
    resources :comments
  end
  resources :users


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'


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
