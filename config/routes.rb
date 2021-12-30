Rails.application.routes.draw do

  root "pages#index"
  get 'search', to: 'pages#search'
  get 'myorder', to: 'pages#myorder'
  get 'verification', to: 'pages#verification'
  
end
