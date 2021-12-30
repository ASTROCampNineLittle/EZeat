Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
  }
  
  devise_scope :user do
    get 'user/profile', to: 'users/registrations#edit'
  end

  root "pages#index"

  resources :stores
  resources :offers , only: [:index , :show] 
  resources :checks , only: [:index , :show]
  resources :payments , only: [:index, :new] do
    post :confirm
  end
end
