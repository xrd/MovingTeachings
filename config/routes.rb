Movingteachings::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  match "reload" => "application#reload"
  match 'teach' => 'dialectics#teach', as: 'teach'
  match 'learn' => 'dialectics#learn', as: 'learn'
  match 'learn/:id' => 'dialectics#show', as: 'show_dialectic'
  match 'welcome/intro' => 'welcome#intro', as: 'intro'
  
  match 'users/loggedIn' => 'users#loggedIn'
  match 'welcome/login' => 'welcome#login'
  
  resources :stops
  resources :routes do
    member do
      get :dialectics
      get :stops
    end
    collection do
      get :alternatives
      get :samples
      get :tmpl
    end
  end
  resources :locations do
    member do
      get :routes
    end
  end
  resources :dialectics do
    collection do
      get :teach
      get :learn
      get :tmpl
    end
  end

  match 'locations/:id/:route_id' => 'locations#show'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
