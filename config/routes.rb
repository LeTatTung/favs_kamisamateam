Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root "pages#show", page: "home"
  get "pages/:page", to: "pages#show", as: "page"
  resources :products, only: [:index, :show]
  resources :users, only: [:index, :show]
end
