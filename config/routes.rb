Rails.application.routes.draw do
  root to: 'opinions#index'

  resources :users, except: :destroy

  resources :opinions, only: %i[index create] do
    resources :comments, only: [:create]
  end

  post '/user/:id/follow', to: 'followings#create', as: 'follow'
  delete '/user/:id/unfollow', to: 'followings#destroy', as: 'unfollow'

  # get '/user/:id', to: 'users#show', as: 'user'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
end
