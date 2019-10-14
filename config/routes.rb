Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users do
  	collection do
  		get :list
  		post :search
  	end
  	member do
  		get :friends
  		get :requests
      post :add
  	end
  end
  
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
