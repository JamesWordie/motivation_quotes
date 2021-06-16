Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#dashboard'
  get '/daily', to: 'pages#daily'
  resources :quotes, except: %i[index show]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/daily', to: 'pages#daily'
    end
  end
end
