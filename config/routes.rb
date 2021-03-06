Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :sneakers, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :update]
  get "bookings/:id/approve", to: "bookings#approve", as: :approve_booking
  get "bookings/:id/refuse", to: "bookings#refuse", as: :refuse_booking
end
