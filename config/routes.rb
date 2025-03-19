Rails.application.routes.draw do
  root "sessions#new" # 他にページがないため指定
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :quizzes, only: %i[index show] do
    resources :solved_quizzes, only: %i[create], module: :quizzes
    resources :comments, only: %i[index new create destroy], module: :quizzes
  end
  resources :users do
    resources :quizzes, module: :users do
      resources :quiz_options, only: %i[index new edit create update destroy], module: :quizzes
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
