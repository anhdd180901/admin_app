Rails.application.routes.draw do
  root "books#index"
  resources :librarians
  resources :books
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root "articles#index"
end
