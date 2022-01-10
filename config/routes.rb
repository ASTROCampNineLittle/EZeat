Rails.application.routes.draw do
  # 將語系設定在所有子網址前，先暫時槓掉避免影響其他路徑
  # scope "(:locale)", :locale => /zh-TW|en|ja/ do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'user/profile', to: 'users/profiles#profile', as: :user_root
    get 'user/edit', to: 'users/registrations#edit'
  end

  root 'pages#index'

  # get 'search', to: 'pages#search'
  get 'myorder', to: 'pages#myorder'
  get 'verification', to: 'pages#verification'
  get 'channel', to: 'pages#channel'

  namespace :pages do
    resources :search, only: [:index] do
    end
  end

  #frontend related routes
  resources :stores, only: [:index, :show] do
    resources :dishes, only: [:index, :show] do
      resources :open_dates, only: [:index, :show] do
      end
    end
  end

  resources :checks , only: [:index , :show, :create]

  resources :payments , only: [:index, :new, :create] do
    post :confirm
  end

  #backend related routes
  namespace :backend do
    resources :companies, except: [:show] do
      resources :stores, shallow: true
    end

    resources :stores, only: [] do
      resources :dishes, except: [:show], shallow: true
    end

    resources :dishes, only: [] do
      resources :open_dates, except: [:show], shallow: true
    end

    resources :open_dates, only: [] do
      resources :offers, except: [:show], shallow: true
    end
  end

  # 未來可用來處理Routing Error 頁面用的，目前先關起來，要看畫面可打 http://localhost:3000/users
  # match '*path', :to => "errors#not_found_404", :via => :all
  match '/404', :to => 'errors#not_found_404', :via => :all
  match '/500', :to => 'errors#not_found_404', :via => :all
  # 看畫面用，之後要刪除
  get 'users', to: 'errors#render_404'

  # end
end