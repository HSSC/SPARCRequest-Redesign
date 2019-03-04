Rails.application.routes.draw do
  devise_for :users

  resource :base, only: [] do
    get :home
    get :dashboard
  end

  resource :protocol, only: [] do
    get :details
  end

  authenticated :user do
    root 'base#dashboard'
  end

  root 'base#home'
end
