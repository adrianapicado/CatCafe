Rails.application.routes.draw do

  resources :appointments
  resources :cats 

  get '/' => 'sessions#welcome'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/signup' =>  'customers#new'

  delete '/logout' => 'sessions#destroy'


end
