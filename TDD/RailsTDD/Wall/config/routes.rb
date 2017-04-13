Rails.application.routes.draw do

  get 'users/new'
  get 'users/index'
  post 'users/create'

  get 'messages/' => "messages#index"
  get 'messages/new'
  post 'messages/create'

  get 'comments/new'
  get 'comments/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
