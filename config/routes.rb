Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users, only: [:show, :new, :create] do
    resources :entries, only: [:new, :create]
  end
  resources :sessions, only: [:new, :create]
end
