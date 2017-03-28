Rails.application.routes.draw do

  get 'dojos' => "dojo#index"
  post 'dojos/create' => "dojo#create"
  get 'dojos/new' => "dojo#new"
  get 'dojos/show/:id' => "dojo#show"
  get 'dojos/edit/:id' => "dojo#edit"
  patch 'dojos/:id' => "dojo#update" 
  delete 'dojos/:id' => "dojo#destroy"

  get '/dojos/:dojo_id/students' => "students#index"
  get '/dojos/:dojo_id/students/new' => "students#new"
  post '/dojos/:dojo_id/students' => "students#create"
  get '/dojos/:dojo_id/students/:id' => "students#show"
  get '/dojos/:dojo_id/students/:id/edit' => "students#edit"
  patch '/dojos/:dojo_id/students/:id' => "students#update"
  delete  '/dojos/:dojo_id/students/:id' => "students#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
