Rails.application.routes.draw do
  resources :projects do
    resources :tasks do
      post 'sorting', on: :collection
      #match 'tasks', to: 'tasks#sorting', via: :get, on: :collection
    end
  end

   root 'projects#index'
end