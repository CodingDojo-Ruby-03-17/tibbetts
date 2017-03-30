Rails.application.routes.draw do

  get '/rpg/index' => "rpg#index"
  post '/rpg/index' => "rpg#index", as: 'rpg_actions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
