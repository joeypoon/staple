Rails.application.routes.draw do

  root 'posts#index'

  get 'staples/new' => 'posts#new', as: :new_staple

  post 'staples' => 'posts#create'

  # users

  get 'users/new' => 'users#new', as: :new_user

  get 'users/:id' => 'users#show', as: :user

  post 'users' => 'users#create'

  # sessions

  get 'login' => 'session#new'

  post 'login' => 'session#create'

  delete 'logout' => 'session#delete'

end
