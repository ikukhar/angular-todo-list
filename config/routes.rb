Rails.application.routes.draw do

  scope 'api' do
    # mount_devise_token_auth_for 'User', at: '/auth'
    resources :projects, only: [:index, :create, :update, :destroy]
    resources :tasks,    only: [:index, :create, :update, :destroy]
    resources :messages, only: [:index, :create, :update, :destroy]
    post 'messages/upload_file/:id', to: 'messages#upload_file'
  end

  # devise_for :users
  mount_devise_token_auth_for 'User', at: '/api/auth'

  root 'templates#start'
  get  'templates/sign_in', to: 'templates#sign_in'
  get  'templates/sign_up', to: 'templates#sign_up'
  get  'templates/index', to: 'templates#index'
  get '*path', to: 'templates#start'


end
