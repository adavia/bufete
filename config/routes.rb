Rails.application.routes.draw do

  resources :tickets
  resources :attachments
  root "sessions#new"

  controller :sessions do
    get    "sign_in"  => :new
    post   "sign_in"  => :create
    delete "sign_out" => :destroy
  end

  resources :companies do
    resources :clients
  end

  resources :clients do
    resources :employees
  end

  resources :users, only: [:new, :create]
end
