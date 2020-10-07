Rails.application.routes.draw do
post 'likes/toggle/:post_id', to: 'likes#toggle', as: :toggle_like
post 'comments/create', as: :comments
  delete 'comments/:id', to: 'comments#destroy', as: :destroy_comment
  get 'users/search', to: 'users#search'
 patch 'posts/:id', to: 'posts#update', as: :post

  get 'posts/:id/edit', to: 'posts#edit', as: :edit_post
	# Post routes
  root 'posts#home'
  post 'posts/create', as: :posts
  delete 'posts/:id', to: 'posts#destroy', as: :destroy_post

  devise_for :users

patch 'comments/:id', to: 'comments#update', as: :comment

  get 'comments/:id/edit', to: 'comments#edit', as: :edit_comment


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
