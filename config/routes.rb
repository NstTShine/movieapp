Rails.application.routes.draw do

  root "pages#show", page: "home"
  get "/*page" => "pages#show"
end
