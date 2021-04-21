Rails.application.routes.draw do

  resources :appointments
  resources :cats 
  resources :customers do 
    resources :appointments, only: [:new, :index]

  end
  
  get '/' => 'sessions#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/signup' =>  'customers#new'

  post '/logout' => 'sessions#destroy'


end
