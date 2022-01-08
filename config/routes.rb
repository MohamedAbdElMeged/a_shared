Rails.application.routes.draw do
  #devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      post "/register", to: "users#sign_up"
      post "/login", to: "users#sign_in"
      get "/profile", to: "users#current_user"
    end
  end
end
