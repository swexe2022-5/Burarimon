Rails.application.routes.draw do
  resources :attraction
  resources :user
  resources :review, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
