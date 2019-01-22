Rails.application.routes.draw do
  devise_for :users

  resource :page, only: [] do
    get :home
    get :dashboard
  end

  root 'pages#home'
end
