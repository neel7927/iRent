Rails.application.routes.draw do
  resources :items
  resources :bookings do
    member do
      post :approve
    end
  end
  resources :reviews, only: [:create, :destroy, :show, :new, :edit, :update]
  get 'about', to: 'pages#about'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
