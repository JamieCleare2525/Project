Rails.application.routes.draw do
  root 'pages#home'
  get '/callback', to: 'pages#callback'
  get '/link_to_trello', to: 'pages#link_to_trello', as: 'link_to_trello'
  get '/add_token_to_user', to: 'application#add_token_to_user'
  post '/add_token_to_user', to: 'application#add_token_to_user'
  resources :bugs

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
