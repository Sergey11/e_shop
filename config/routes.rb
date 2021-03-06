EShop::Application.routes.draw do

  resources :users
  resources :products
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :products
  end

  root 'static_pages#start'

  match '/signout',    to: 'sessions#destroy'   , via: 'delete'
  match '/fogotpassword',    to: 'sessions#fogotpassword'   , via: 'get'

  match '/create_token',    to: 'tokens#create_token'   , via: 'get'
  match '/reset_password',    to: 'tokens#reset_password'   , via: 'get'
  match '/token/:token',    to: 'tokens#parse_token'   , via: 'get'
  match '/update_password',    to: 'tokens#update_password'   , via: 'post'
  
  match '/start', to: 'static_pages#start', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/faq', to: 'static_pages#faq', via: 'get'
  match '/our_works', to: 'static_pages#our_works', via: 'get'
  match '/partnerships', to: 'static_pages#partnerships', via: 'get'
  match '/leadership', to: 'static_pages#leadership', via: 'get'
  match '/news', to: 'static_pages#news', via: 'get'
  match '/events', to: 'static_pages#events', via: 'get'
  match '/blog', to: 'static_pages#blog', via: 'get'
  match '/product', to: 'static_pages#product', via: 'get'
  match '/allproduct', to: 'static_pages#allproduct', via: 'get'

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
