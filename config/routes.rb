Rails.application.routes.draw do
  get 'color_diagnoses/new'
  get 'color_diagnoses/create'
  get 'color_diagnoses/show'
  devise_for :users  
  resources :users, only: [:show]
  get 'mypage', to: 'users#show' # マイページへのルート

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

  resources :fashion_profiles

  resources :body_diagnoses, only: [:new, :create, :show, :index]

  resources :color_diagnoses, only: [:new, :create, :show, :index]
end
