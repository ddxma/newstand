Rails.application.routes.draw do
  resources :articles
  root 'articles#index'

  # Step 21.
  # Map the GET request for the URL /signup to the Users controller's
  # new action.
  get 'signup' => 'users#new'
  resources :users

  # Step 32.
  # Map GET requests for the URL /login to the Sessions controller's 
  # new action
  get '/login' => 'sessions#new'

  # Step 33.
  # Map POST requests for the URL /login to the Sessions controller's 
  # create action, handle POST requests and check whether 
  # the submitted username and password match the ones in the database.
  post '/login' => 'sessions#create'

  # Step 40.
  # Map DELETE requests for the url /logout to the Sessions controller's
  # destroy action.
  delete '/logout' => 'sessions#destroy'

  get 'edit' => 'users#edit'
  post 'edit' => 'users#update'

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
