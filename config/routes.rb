Rails.application.routes.draw do

  root 'posts#index'

  # posts

  get 'staples/new' => 'posts#new_staple', as: :new_staple

  get 'staples/:id' => 'posts#staple_modal', as: :staple_modal

  post 'staples' => 'posts#create'

  # users

  get 'users/new' => 'users#new', as: :new_user

  get 'users/:id' => 'users#show', as: :user

  get 'me' => 'users#me_edit', as: :me_edit

  get 'me/stapled' => 'users#my_stapled', as: :my_stapled

  post 'me/staple/:post_id' => 'users#staple_post', as: :staple_post

  post 'me/unstaple/:post_id' => 'users#unstaple_post', as: :unstaple_post

  patch 'me' => 'users#update'

  post 'users' => 'users#create'

  # sessions

  get 'login' => 'session#new'

  post 'login' => 'session#create'

  delete 'logout' => 'session#delete'

end
