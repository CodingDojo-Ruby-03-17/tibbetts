Rails.application.routes.draw do

  # dojo routes
  get 'dojos' => "dojo#index"
  post 'dojos/create' => "dojo#create"
  get 'dojos/new' => "dojo#new"
  get 'dojos/show/:id' => "dojo#show", as: "dojos_show"
  get 'dojos/edit/:id' => "dojo#edit", as: "dojos_edit"
  patch 'dojos/:id' => "dojo#update", as: "dojos_update"
  delete 'dojos/:id' => "dojo#destroy", as: "dojos_destroy"

  # dojo's students routes
  get '/dojos/:dojo_id/students' => "students#index", as: "students"
  post '/dojos/:dojo_id/students' => "students#create", as: "students_create"
  get '/dojos/:dojo_id/students/new' => "students#new", as: "students_new"
  get '/dojos/:dojo_id/students/:id' => "students#show", as: "students_show"
  get '/dojos/:dojo_id/students/:id/edit' => "students#edit", as: "students_edit"
  patch '/dojos/:dojo_id/students/:id' => "students#update", as: "students_update"
  delete  '/dojos/:dojo_id/students/:id' => "students#destroy", as: "students_destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
