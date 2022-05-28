Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/destroy'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/edit'
  get 'bookings/new'
  get 'bookings/create'
  get 'items/home'
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/create'
  get 'items/edit'
  get 'items/destroy'
  get 'about', to: 'pages#about'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
