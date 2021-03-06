Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users, only: [:new, :create] do
    resources :entries, only: [:new, :create]
  end
  resources :dashboard, only: [:index]

  resources :sessions, only: [:new, :create]
end
