Rails.application.routes.draw do

  root "movies#index", page: "home"
  get "/pages/*page" => "pages#show"

  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  resources :users, only: :show
  resources :movies do
    resources :comments
  end
  resources :rating_movies
  resources :searchs, only: :index

  namespace :admin do
    root "admin/movies#index"
    resources :categories
    resources :countries
    resources :users
    resources :movies
  end
end
