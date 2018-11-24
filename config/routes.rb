Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :residences
  resources :vistas, :only => [:show]
  resources :vistas, :only => [:index]
  resources :vistas, :only => [:edit]
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end


	#user: 'users/show'

  root "residences#home"
end

