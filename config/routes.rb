Rails.application.routes.draw do
  resources :items
  resources :bookings, only: [:create, :index, :show, :new, :edit, :update]
  resources :reviews, only: [:create, :destroy, :show, :new, :edit, :update]
  get 'about', to: 'pages#about'
  get 'items/:id/edit', to: 'items#edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
