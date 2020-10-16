Rails.application.routes.draw do
  root to: 'opinions#index'

  resources :users, only: %i[new create]

  resources :opinions, only: %i[index create] do
    resources :comments, only: [:create]
  end

  post 'opinion', to: 'opinions#create'
  post 'follow', to: 'followings#create'
  delete '/user/:id/unfollow', to: 'followings#destroy'

  get '/user/:id', to: 'users#show', as: 'user'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'log_out', to: 'sessions#destroy'
end
