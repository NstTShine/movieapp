Rails.application.routes.draw do

  root "pages#show", page: "home"
  get "/:page" => "pages#show"

  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  resources :users, only: :show
end
