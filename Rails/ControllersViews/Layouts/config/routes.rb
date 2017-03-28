Rails.application.routes.draw do
  get '/' => "users#index"
  post '/create' => "users#create" 

  get '/posts' => "posts#index"
  post '/posts/create' => "posts#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
