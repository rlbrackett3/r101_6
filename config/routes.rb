Rails.application.routes.draw do

  resources :users do 
    resources :boards
    resources :topics
    resources :comments
  end

  resources :topics do
    resources :comments, only: [:index, :new, :create]
  end

  resources :comments, only: [:show, :edit, :update, :destroy]

  get '/add-topic' => "boards#add"

  resources :boards do 
    resources :topics
  end

  resources :topics do 
    resources :boards
  end
  





  #resources :comments #weird
  

  resources :sessions,only: [:new, :create, :destroy]
  root :to => 'sessions#index'

  get '/' => "sessions#index",as: 'home'

  get '/search' => "home#results"

  #get '/search' => "home#results" ///////////<-uncomment me when the time is right. 

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
