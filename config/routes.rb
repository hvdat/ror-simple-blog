Rails.application.routes.draw do
  devise_for :users, path: 'accounts'

  resources :users do
    resources :articles do
      resources :comments
    end
  end

  root 'home#index'
end
