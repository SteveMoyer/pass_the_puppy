PassThePuppy::Application.routes.draw do
  devise_for :users
  
  root :to => "puppies#index"
  resources :puppies do
     member do
      put 'take'
      post 'leave'
    end
  end
end
