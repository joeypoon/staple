Rails.application.routes.draw do

  root 'users#index'

  get 'users/new' => 'users#new', as: :new_user

  post 'users' => 'users#create'

end
