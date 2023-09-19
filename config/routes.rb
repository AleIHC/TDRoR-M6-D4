Rails.application.routes.draw do
  resources :kp_comments
  resources :kp_posts
  devise_for :kp_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "kp_posts#index"
end
