PassThePuppy::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
 
  root :to => "puppies#index"
  resources :users
  resources :sessions
  resources :puppies do
     member do
      put 'take'
      put 'leave'
    end
  end
end
