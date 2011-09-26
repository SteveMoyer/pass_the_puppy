PassThePuppy::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "change_password" => "users#change_password", :as=> "change_password" 
  post "change_password" => "users#change_password", :as=> "change_password" 
  root :to => "puppies#index"
  resources :users do 
    collection  do
     post 'change_password'
     get 'change_password'
    end
  end 
  resources :sessions
  resources :puppies do
     member do
      put 'take'
      post 'leave'
    end
  end
end
