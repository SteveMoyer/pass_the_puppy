PassThePuppy::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
 
  root :to => "puppy#view"
  resources :users
  resources :sessions
  resource :puppy do
    get 'view'
    put 'take'
    put 'leave'
  end
end
