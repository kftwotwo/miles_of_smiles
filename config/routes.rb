Rails.application.routes.draw do
  root 'welcome#index'
  get '/about' => 'welcome#show'
  devise_for :users
  resources :products do
    resources :reviews
  end
end
