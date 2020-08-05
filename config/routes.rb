Rails.application.routes.draw do
  devise_for :users
  root "home#top"
  get 'home/about' => 'home#about', as: 'about'
  resources :users, only: [:show, :index, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
