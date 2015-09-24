Rails.application.routes.draw do

  root 'static_pages#index'
  get '*path', to: 'static_pages#index', constraints: lambda { |request| !request.url.include?('/api/') }

  scope 'api' do
    mount_devise_token_auth_for 'User', at: '/auth'
    resources :projects, only: [:index, :create, :update, :destroy]
    resources :tasks,    only: [:index, :create, :update, :destroy]
  end

end
