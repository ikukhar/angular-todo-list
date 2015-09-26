Rails.application.routes.draw do

  root 'templates#nothing'
  get  'sign_in', to: 'templates#sign_in'
  get  'sign_up', to: 'templates#sign_up'
  get  'templates/index', to: 'templates#index'
  # get '*path', to: 'templates#index', constraints: lambda { |request| !request.url.include?('/api/') }

  scope 'api' do
    mount_devise_token_auth_for 'User', at: '/auth'
    resources :projects, only: [:index, :create, :update, :destroy]
    resources :tasks,    only: [:index, :create, :update, :destroy]
    resources :messages, only: [:index, :create, :update, :destroy]
    post 'messages/upload_file/:id', to: 'messages#upload_file'
  end

end
