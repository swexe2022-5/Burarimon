Rails.application.routes.draw do
  root 'attraction#index'
  get "attraction/search"
  resources :attraction
  resources :user
  resources :review, only: [:new, :create, :destroy]
  post 'user/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
