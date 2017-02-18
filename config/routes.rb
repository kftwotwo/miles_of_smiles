Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'
  get '/about' => 'welcome#show'
  devise_for :users
  resources :products do
    resources :reviews
  end
end
