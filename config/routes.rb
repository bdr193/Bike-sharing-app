Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  resources :bikes do
    resources :bookings, only: [:new, :create]
  end
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :bookings, only: [:index, :show, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
