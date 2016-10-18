Rails.application.routes.draw do

  root "sessions#new"

  controller :sessions do
    get    "sign_in"  => :new
    post   "sign_in"  => :create
    delete "sign_out" => :destroy
  end

  resources :companies do
    resources :clients
  end

  resources :employees

  resources :users, only: [:new, :create]
end
