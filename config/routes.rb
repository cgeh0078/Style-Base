Rails.application.routes.draw do
  devise_for :users  
  resources :users, only: [:show]

  get 'hello/index' => 'hello#index'
  root 'hello#index'
  
  resources :closets, only: [:index, :new, :create, :show ,:edit, :update, :destroy] do
    member do
      get 'show_top', to: 'closets#show_top'
      get 'show_bottom', to: 'closets#show_bottom'
    end
  end
  resources :tweets  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'suggestions1' => 'suggestions1#index'
end