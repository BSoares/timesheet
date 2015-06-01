Rails.application.routes.draw do
  root to: "home#home"

  get :login, to: "sessions#new"
  post :login, to: "sessions#create", as: :session_create
  delete :logout, to: "sessions#destroy"

  resources :employees, except: :show do
    resources :month_attendances, only: [:new, :create]
  end

  resources :attendances, only: :create
end
