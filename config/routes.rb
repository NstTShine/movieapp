Rails.application.routes.draw do

  root "pages#show", page: "home"
  get "pages/:page" => "pages#show"

  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  resources :users, only: :show
  resources :movies
  resources :searchs
end
