Rails.application.routes.draw do
  root to: "home#home"

  resources :sessions, only: [:new, :create]
end
