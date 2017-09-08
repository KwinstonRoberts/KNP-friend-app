Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only:[:index]
  resources :test, only:[:index]
  resources :login, only:[:index,:create]
  resources :register, only:[:index,:create]
  resources :profile, except:[:destroy,:new,:edit]

post '/user/personality' => 'users#personality'
end