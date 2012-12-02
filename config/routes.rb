Eywa::Application.routes.draw do

  resources :fellowships
  resources :roles, :path => "/admin/roles"

  match 'account/settings' => 'users#edit', :as => :edit_current_user
  match 'account/signup' => 'users#new', :as => :signup
  resources :users, :only => [:create, :update]

  match 'organisation/:id/settings' => 'organisations#edit', :as => :edit_organisation
  match 'organisation/new' => 'organisations#new', :as => :new_organisation
  resources :organisations, :only => [:create, :update]

  match 'account/logout' => 'sessions#destroy', :as => :logout
  match 'account/login' => 'sessions#new', :as => :login
  resources :sessions

  match 'organisation/leave' => 'sessions#leave', :as => :switch_back
 
  # Remove the controllername in the url
  # at http://jasoncodes.com/posts/rails-3-nested-resource-slugs
  resources :accounts, :only => [:show, :destroy], :path => ''
  resources :accounts, :path => '', :only => [] do 
    resources :projects, :path => '', :except => [:index] do    
      resources :definitions # , :contexts, :articles, :wikis , :clones(forks?)
    end
  end

# resources :forks, :only => [:new, :create], :path_names => { :new => 'fork' }



  # vgl. http://railscasts.com/episodes/221-subdomains-in-rails-3
  # constraints(Subdomain) do
  #   match '/' => 'projects#show'
  # end

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

  # See how all your routes lay out with "rake routes"

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html. 
  root :to => 'dashboard#index'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
