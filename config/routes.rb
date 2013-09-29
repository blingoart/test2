Blingo::Application.routes.draw do

  root :to => "site#index"
  post "/prelaunch", :to => "site#prelaunch", :as => :prelaunch

  #get "/artists", :to => "artists/#show", :as => :artists
  resources :artists

  # admin routes
  namespace :admin do
    get     '/', :to => 'sessions#new',      :as => 'login'
    post    '/', :to => 'sessions#create'
    delete  '/', :to => 'sessions#destroy',  :as => 'logout'
    resources :dashboard, :only => 'index'
  end


  namespace :onboarding do
    get "/:signin_name",                  :to => "images#show",           :as => :images
    get "/new/:signin_name",              :to => "images#new",            :as => :images_new
    match "/create/:signin_name",         :to => "images#create",         :as => :images_create
    get "/:id/edit/:signin_name",         :to => "images#edit",           :as => :images_edit
    delete "/:id/:signin_name",           :to => "images#destroy",        :as => :images_destroy
    post "/:signin_name/zip/create",      :to => 'images#create_zip',     :as => :images_create_zip
    post '/:signin_name',                 :to => 'sessions#create',       :as => :artist_signin
    match '/signout/:signin_name',        :to => 'sessions#destroy',      :as => :artist_signout
    get "/bio/:signin_name",              :to => "artists#show",          :as => :artist_show
    match "/create/bio/:signin_name",     :to => "artists#create",        :as => :artist_create
    delete "/photo/bio/:signin_name",     :to => "artists#destroy_photo", :as => :artist_photo_destroy
    get "/legal/:signin_name",            :to => "artists#legal",         :as => :legal
    get "createartist/:signin_name",      :to => "artists#signin_create"

  end

  namespace :api do
    get "/packs", :to => "api#packs", :as => :packs
    get "/stickers", :to => "api#stickers", :as => :stickers
    get "/download", :to => "api#download", :as => :stickers
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
