Rails.application.routes.draw do
  devise_for :students, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root 'welcome#index'

  get "/jobs" => "jobs#index"
end
