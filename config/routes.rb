Rails.application.routes.draw do
  resources :books, only: [:index, :create, :new, :edit, :show, :update]
  resources :report, only: [:index]
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
