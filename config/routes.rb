Rails.application.routes.draw do

  root "pages#show", page: "home"
  get "/:page" => "pages#show"

  devise_for :users
  resources :users, only: :show
end
