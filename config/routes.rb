Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace 'admin' do
    get '/', to: 'products#index'
    resources :users, :travel_agents
    resources :products do
      member do
        post 'create_photo'
      end      
    end
  end

  namespace :api do
    post 'qiniu/callback' => 'qiniu#callback'

    resources :products, :visitors
    resources :users do
      collection do
        post 'sign_up', action: 'sign_up_user'
        post 'sign_in', action: 'sign_in_user'
      end
      member do
        post 'set_travel_agent'
      end
    end

    resources :travel_agents, only: [:index]

    resources :orders do
      collection do
        get 'ongoing'
      end
    end
  end
end
