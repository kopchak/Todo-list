Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks do
      post 'sorting', on: :collection
      #match 'tasks', to: 'tasks#sorting', via: :get, on: :collection
    end
  end

   root 'projects#index'
end