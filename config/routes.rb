Rails.application.routes.draw do
  root 'attraction#index'
  get "attraction/search"
  post 'attraction/searchdb'
  resources :attraction
  resources :user
  resources :review, only: [:new, :create, :destroy]
  post 'user/login'
  get 'get_image/:id', to: 'user#get_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
