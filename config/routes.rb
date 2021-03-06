Rails.application.routes.draw do

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end

  get '/user_profile', to: 'form_user#user_profile'

  get 'meets_or_events/upcoming_events'

  get 'meets_or_events/all_events'

  get 'meets_or_events/agendas'

  # get 'home_page/home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home_page#home'
  get '/upcoming_events', to: 'home_page#upcoming_events'
  get '/all_events', to: 'home_page#all_events'
  get '/agendas', to: 'home_page#agendas'

  # Alumni routes
  get '/my_profile', to: 'alumni#my_profile'
  get '/alumni_personal_info', to: 'alumni#alumni_personal_info_form'
  get '/alumni_schooling_info', to: 'alumni#alumni_schooling_info_form'
  get '/alumni_current_location_n_occupation_info', to: 'alumni#alumni_current_location_n_occupation_info_form'
  post '/update_alumni_personal_info', to: 'alumni#update_alumni_personal_info'
  post '/update_alumni_schooling_info', to: 'alumni#update_alumni_schooling_info'
  post '/update_alumni_current_location_n_occupation_info', to: 'alumni#update_alumni_current_location_n_occupation_info'

  # Search routes
  get '/search', to: 'search#search'

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
