Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'
  get '/explore', to: 'posts#explore'

  resources :users, param: :username, only: [:index, :show, :edit, :update] do
    resources :posts, except: [:index]
  end

  resources :relationships, only: [:create, :destroy]
end
