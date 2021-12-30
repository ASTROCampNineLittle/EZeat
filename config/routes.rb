Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
  }
  
  devise_scope :user do
    get 'user/profile', to: 'users/registrations#edit'
  end

  root "pages#index"

  
  #backend related routes
  namespace :backend do
    resources :companies, except: [:show] do
      resources :stores, shallow: true
    end

    resources :stores, only: [] do
      resources :dishes, except: [:show], shallow: true
    end

    resources :dishes, only: [] do
      resources :offers, except: [:show], shallow: true
    end

    resources :dishes, only: [] do
      resources :open_dates, except: [:show], shallow: true
    end

    resources :open_dates, only: [] do
      resources :offers, except: [:show], shallow: true
    end

  end


end
