Rails.application.routes.draw do
  get "/signup", to: "users#new"
  root "users#new" # 他にページがないため指定
  resources :users do 
    resources :quizzes, only: [:new, :create, :show, :edit, :update, :destroy], module: :users
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
