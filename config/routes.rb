Rails.application.routes.draw do
  root 'attraction#index'
  get "attraction/search"
  post 'attraction/searchdb'
  resources :attraction
  resources :user
  resources :review, only: [:new, :create, :destroy]
  post 'user/login'
  get 'get_image/:id', to: 'user#get_image'
  get 'get_picture1/:id', to: 'attraction#get_picture1'
  get 'get_picture2/:id', to: 'attraction#get_picture2'
  get 'get_picture3/:id', to: 'attraction#get_picture3'
  get 'get_picture4/:id', to: 'attraction#get_picture4'
  get 'get_picture5/:id', to: 'attraction#get_picture5'
  get 'get_picture6/:id', to: 'attraction#get_picture6'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
