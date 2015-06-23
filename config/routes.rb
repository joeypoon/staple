Rails.application.routes.draw do

  root 'posts#index'

  # posts

  get 'staples/new' => 'posts#new_staple', as: :new_staple

  get 'posts/me' => 'posts#my_posts', as: :my_posts

  get 'staples/:id' => 'posts#staple_modal', as: :staple_modal

  get 'posts/:tag' => 'posts#posts_with_tag', as: :posts_with_tag

  get 'search' => 'posts#search'

  post 'staples' => 'posts#create'

  delete 'posts/:post_id' => 'posts#destroy', as: :destroy_post

  # users

  get 'users/new' => 'users#new', as: :new_user

  get 'users/:id' => 'users#show', as: :user

  get 'me' => 'users#me_edit', as: :me_edit

  get 'me/stapled' => 'users#my_stapled', as: :my_stapled

  post 'me/staple/:post_id' => 'users#staple_post', as: :staple_post

  post 'me/unstaple/:post_id' => 'users#unstaple_post', as: :unstaple_post

  post 'me/like/:post_id' => 'users#like_post', as: :like_post

  post 'me/unlike/:post_id' => 'users#unlike_post', as: :unlike_post

  patch 'me' => 'users#update'

  post 'users' => 'users#create'

  # sessions

  get 'login' => 'session#new'

  post 'login' => 'session#create'

  delete 'logout' => 'session#delete'

end
