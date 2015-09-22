Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :students
  get "auth/:action/callback", constraints: { action: /github/ }, controller: "omniauth_callbacks"

  # Somehow we only need one route to sign out both students and admins
  devise_scope :student do
    delete "sessions" => "devise/sessions#destroy", as: :sign_out
  end

  root 'welcome#index'
  resources :jobs, only: :index do
    post :apply
  end
end
