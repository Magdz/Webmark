Rails.application.routes.draw do
  resources :notifications
  get 'users/notifications/show/:recevier_id' => 'notifications#show'
  resources :followers
  get 'followers/:id/following_show' => 'followers#following_show'
  get 'followers/:id/followers_show' => 'followers#followers_show'

  resources :remarks

  resources :subcategories do
    resources :bookmarks
  end

  resources :categories do
    resources :subcategories
  end

  devise_for :users
  resources :users, :only => [:show]
  
  resources :bookmarks  
  get 'bookmarks/update_subcategories/:category_id' =>'bookmarks#update_subcategories'
  get 'update_subcategories/:category_id' =>'bookmarks#update_subcategories'
  get 'update_bookmarks/:subcategory_id' =>'bookmarks#update_bookmarks'
  get 'update_bookmarkkkks/:user_id' =>'bookmarks#update_bookmarkkkks'
  get 'All/' => 'bookmarks#All'
  resources :bookmarks do 
    member do
      put "like", to: "bookmarks#upvote"
      put "dislike", to: "bookmarks#downvote"
    end
    resources :remakrs
  end

  resources :followers do
    member do
      put "follow", to: "followers#follow"
      delete "unfollow", to: "followers#unfollow"
      get "followers_count", to: "followers#followers_count"
      get "following_count", to: "followers#following_count"
      post "followers_show", to: "followers#followers_show"
      post "following_show", to: "followers#following_show"
    end
  end

  root to: "bookmarks#index"

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
