Rails.application.routes.draw do
  root "sessions#new" # 他にページがないため指定
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    resources :quizzes, module: :users
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
