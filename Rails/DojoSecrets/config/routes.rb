Rails.application.routes.draw do
  get 'users/:id/show/' => 'users#show'
  get 'users/new'
  post 'users/create'
  patch 'users/:id' => "users#update"
  get 'users/:id/edit' => "users#edit"
  delete 'users/:id/destroy' => "users#destroy"

  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/:id' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
