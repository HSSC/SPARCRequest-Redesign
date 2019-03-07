Rails.application.routes.draw do
  devise_for :users

  resource :base, only: [] do
    get :home
  end

  resources :epic_queues, only: [:index] do
  end

  resources :protocols, only: [:index, :show] do
  end

  resource :protocol, only: [] do
    get :validate
    get :details
  end

  resources :settings, only: [:index] do
  end

  resources :users, only: [:show, :edite] do
  end

  match '/dashboard' => 'protocols#index', via: [:get]

  root 'base#home'
end
