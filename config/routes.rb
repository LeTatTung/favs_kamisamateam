Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations,
    omniauth_callbacks: :omniauth_callbacks}

  root "pages#show", page: "home"
  get "pages/:page", to: "pages#show", as: "page"
  resources :products, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :posts do
    resources :comments, except: :show
    resources :activities, only: [:create, :destroy]
  end
  resources :comments do
    resources :reply_comments, except: :show
  end
end
