Rails.application.routes.draw do

  root "pages#index"
  get 'search', to: 'pages#search'
  
end
