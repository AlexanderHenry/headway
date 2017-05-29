Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise_customizations/registrations',
  }

  resources :users do
    member do
      get 'analytics_alias'
    end
  end

  namespace :admin do
    resources :users do
      member do
        get 'impersonate'
      end

      collection do
        get 'stop_impersonating'
      end
    end
  end

  authenticated :user do
    # root to: 'dashboard#show', as: :authenticated_root
    root to: 'users#index', id: 'index', as: :authenticated_root
  end

  devise_scope :user do
    get 'sign-in',  to: 'devise/sessions#new'
    get 'sign-out', to: 'devise/sessions#destroy'
  end
  root 'users#index', id: 'index'
end
