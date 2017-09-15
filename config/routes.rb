Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only:[:index]
  resources :test, only:[:index,:update]
  resources :login, only:[:index,:create,:destroy]
  resources :register, only:[:index,:create]
  resources :profile, except:[:destroy,:new,:edit] do
    resources :activities
  end


post '/user/personality' => 'users#personality'
end
