Rails.application.routes.draw do
  get 'calendar/month'
  get 'calendar/week'
  devise_for :users
  resources :requisitions
  namespace :admin do
    resources :clients
    resources :users
    resources :roles

    root to: 'clients#index'
  end
  get 'dashboard/index'
  devise_for :clients, path: '',
              path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'sign-up' }

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
