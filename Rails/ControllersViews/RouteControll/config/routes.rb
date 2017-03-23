Rails.application.routes.draw do
  get 'hello' => "hello#index"

  get '' => "say#index"
  get 'say/hello' => "say#hello"
  get 'say/hello/:name' => "say#show"

  get 'times' => "time#index"
  get 'times/restart' => "time#restart"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
