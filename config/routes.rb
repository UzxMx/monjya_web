Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace 'admin' do
    get '/', to: 'products#index'
    resources :users
    resources :products do
      member do
        post 'create_photo'
      end      
    end
  end

  namespace :api do
    post 'qiniu/callback' => 'qiniu#callback'

    resources :products
  end
end
