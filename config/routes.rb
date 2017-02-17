Rails.application.routes.draw do
  root 'welcome#index'
  get '/about' => 'welcome#show'
  devise_for :users
  resources :products
end
