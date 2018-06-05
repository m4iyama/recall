Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'

  resources :users, param: :username, only: [:index, :show, :edit, :update] do
    resources :posts, except: [:index]
  end
end
