Rails.application.routes.draw do
  root "sessions#new" # 他にページがないため指定
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :quizzes, %i[index, show] do
    resources :solved_quizzes, %i[create] do
    end
  end
  resources :users do
    resources :quizzes, module: :users do
      resources :quiz_options, only: %i[index new edit create update destroy], module: :quizzes
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
