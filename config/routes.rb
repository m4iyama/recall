Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users, param: :username do
    resources :posts, except: [:index]
  end
end
