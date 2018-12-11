Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :residences do
    get :versemanasvencidas, on: :member
  end

  get '/versemanas', to: 'residences#versemanas'



  resources :reservations
  get '/nuevareserva', to: 'reservations#nuevareserva'
  get '/nuevareservahs', to: 'reservations#nuevareservahs'
  get '/misreservas', to: 'reservations#misreservas'
  

  resources :vistas, :only => [:show]
  resources :vistas, :only => [:index]
  resources :vistas, :only => [:edit]
  get '/veradmin', to: 'vistas#veradmin'
  get '/editadmin', to: 'vistas#editadmin'
  get '/contacto', to: 'vistas#contacto'
  get '/ayuda', to: 'vistas#ayuda'
  get '/acercade', to: 'vistas#acercade'

  resources :hotsales
  get '/crearhs', to: 'hotsales#crearhs'
  

  resources :petitions
  resources :apetitions
  get '/registrosubasta', to: 'apetitions#registrosubasta'


  get '/nuevasubasta', to: 'auctions#nuevasubasta'
  get '/subastasactivas', to: 'auctions#subastasactivas'
  get 'terminarsubasta', to: 'auctions#terminarsubasta'
  get 'missubastas', to: 'auctions#missubastas'
  resources :auctions do
    get :iniciarsubasta, on: :member
    get :pujar, on: :member

  end
  
  
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end


	#user: 'users/show'
  
  root "residences#home"
end

