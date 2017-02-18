Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace 'admin' do
    get '/', to: 'products#index'
    resources :users, :products
  end
end
