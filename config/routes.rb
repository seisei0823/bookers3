Rails.application.routes.draw do

	devise_for :users
  resources :users,only: [:show,:edit,:update,:index]
  resources :books do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'

end
