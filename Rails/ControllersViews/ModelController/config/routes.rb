Rails.application.routes.draw do

  get 'products/' => 'products#index'
  post 'products/' => 'products#create'
  get 'products/new/' => 'products#new'
  get 'products/total' => 'products#total'
  get 'products/:id/edit' => 'products#edit'
  get 'products/:id' => 'products#show'
  post 'products/:id' => 'products#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
