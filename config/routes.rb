Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  # Routes for the Event resource:
  # CREATE
  get('/events/new', { :controller => 'events', :action => 'new' })
  get('/create_event', { :controller => 'events', :action => 'create' })

  # READ
  get('/events', { :controller => 'events', :action => 'index' })
  get('/events/:id', { :controller => 'events', :action => 'show' })
  get('/my_events', { :controller => 'events', :action => 'my_events'})

  # UPDATE
  get('/events/:id/edit', { :controller => 'events', :action => 'edit' })
  get('/update_event/:id', { :controller => 'events', :action => 'update' })

  # DELETE
  get('/delete_event/:id', { :controller => 'events', :action => 'destroy' })

  # EMAIL EVENT
  get('email_event/:id', { :controller => 'events', :action => 'email'})
  #------------------------------

  # Routes for the Available Tickets resource:
  # CREATE

  #READ
  get('/available_tickets', { :controller => 'available', :action => 'index'})
  get('/tickets/:id', { :controller => 'available', :action => 'show'})

  # Routes for the Genre resource:
  # CREATE
  get('/genres/new', { :controller => 'genres', :action => 'new' })
  get('/create_genre', { :controller => 'genres', :action => 'create' })

  # READ
  get('/genres', { :controller => 'genres', :action => 'index' })
  get('/genres/:id', { :controller => 'genres', :action => 'show' })

  # UPDATE
  get('/genres/:id/edit', { :controller => 'genres', :action => 'edit' })
  get('/update_genre/:id', { :controller => 'genres', :action => 'update' })

  # DELETE
  get('/delete_genre/:id', { :controller => 'genres', :action => 'destroy' })
  #------------------------------

  # Routes for the Region resource:
  # CREATE
  get('/regions/new', { :controller => 'regions', :action => 'new' })
  get('/create_region', { :controller => 'regions', :action => 'create' })

  # READ
  get('/regions', { :controller => 'regions', :action => 'index' })
  get('/regions/:id', { :controller => 'regions', :action => 'show' })

  # UPDATE
  get('/regions/:id/edit', { :controller => 'regions', :action => 'edit' })
  get('/update_region/:id', { :controller => 'regions', :action => 'update' })

  # DELETE
  get('/delete_region/:id', { :controller => 'regions', :action => 'destroy' })
  #------------------------------

  # Routes for the Tagging resource:
  # CREATE
  get('/taggings/new', { :controller => 'taggings', :action => 'new' })
  get('/create_tagging', { :controller => 'taggings', :action => 'create' })

  # READ
  get('/taggings', { :controller => 'taggings', :action => 'index' })
  get('/taggings/:id', { :controller => 'taggings', :action => 'show' })

  # UPDATE
  get('/taggings/:id/edit', { :controller => 'taggings', :action => 'edit' })
  get('/update_tagging/:id', { :controller => 'taggings', :action => 'update' })

  # DELETE
  get('/delete_tagging/:id', { :controller => 'taggings', :action => 'destroy' })
  #------------------------------

  # Routes for the Interest resource:
  # CREATE
  get('/interests/new', { :controller => 'interests', :action => 'new' })
  get('/create_interest', { :controller => 'interests', :action => 'create' })

  # READ
  get('/interests', { :controller => 'interests', :action => 'index' })
  get('/interests/:id', { :controller => 'interests', :action => 'show' })

  # UPDATE
  get('/interests/:id/edit', { :controller => 'interests', :action => 'edit' })
  get('/update_interest/:id', { :controller => 'interests', :action => 'update' })

  # DELETE
  get('/delete_interest/:id', { :controller => 'interests', :action => 'destroy' })
  get('/delete_interest', { :controller => 'interests', :action => 'destroy_with_form'})
  #------------------------------


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
