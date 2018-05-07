Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users, only: [:index, :show] do
    resources :trips
  end

  get '/policies/find_policies' => 'policies#find_policies'

end
