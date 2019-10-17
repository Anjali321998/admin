Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users do
  	collection do
  		post :search
  	end
  end
  resources :friends do
    member do
      get :accept
      get :reject
      get :frequest
    end
  end
  
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end