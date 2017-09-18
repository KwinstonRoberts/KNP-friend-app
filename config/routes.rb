Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only:[:index]
  resources :test, only:[:index,:update]
  resources :login, only:[:index,:create,:destroy]
  resources :register, only:[:index,:create]
<<<<<<< HEAD
  resources :profile, except:[:destroy,:new,:edit]
  resources :chat
  resources :message
  mount ActionCable.server => '/cable'
=======
  resources :profile, except:[:destroy,:new,:edit] do
    resources :activities
  end
  resources :chat


>>>>>>> master


post '/user/personality' => 'users#personality'
end
