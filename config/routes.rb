Rails.application.routes.draw do
  resources :pages do
    get :home
  end

  root to: 'pages#home'
end
