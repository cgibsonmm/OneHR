Rails.application.routes.draw do
  namespace :admin do
    resources :clients
    resources :users
    resources :roles

    root to: 'clients#index'
  end
  get 'dashboard/index'
  devise_for :clients
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
