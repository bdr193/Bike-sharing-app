Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  resources :bikes
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users do
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
