Rails.application.routes.draw do
  resources :items do
     resources :bookings, only: [:create,:new]
  end
  resources :bookings, only: [:index, :show,:edit, :update]
  resources :reviews, only: [:create, :destroy, :show, :new, :edit, :update]
  get 'about', to: 'pages#about'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
