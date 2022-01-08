Rails.application.routes.draw do

  resources :books
  resources :registrations, only: [:create]
  resources :sessions, only: [:create]
  resources :users, only: [:create]

  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end