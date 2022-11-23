Rails.application.routes.draw do
  root 'attraction#index'
  resources :attraction
  resources :user
  resources :review, only: [:new, :create, :destroy]
  post 'user/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
