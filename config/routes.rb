Rails.application.routes.draw do
  root 'welcome#index'
  get 'calendar/month'
  get 'calendar/week'
  get 'dashboard/index'

  resources :requisitions
  namespace :admin do
    resources :clients
    resources :users
    resources :roles
    root to: 'clients#index'
  end

  devise_for :users
  devise_for :clients,
              path: 'clients',
              controllers: {
               sessions: 'cilents/sessions'
             }
end
