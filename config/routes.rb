Rails.application.routes.draw do
  namespace :api do
    post 'chat', to: 'chat#create'
  end

  root "dances#index"

  resources :dances do
    resources :videos
  end

  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"

  put "/profile", to: "profile#update"
  put "/profile/password", to: "profile#change_password"

  get "/bookmarks", to: "bookmarks#index"
  post "/bookmarks", to: "bookmarks#create"
  delete "/bookmarks/:id", to: "bookmarks#destroy"

  get "/progress", to: "progresses#index"
  post "/progress", to: "progresses#create"
  delete "/progress/:id", to: "progresses#destroy"

  get "/dances/:dance_id/quizzes", to: "quizzes#index"
  post "/quizzes/:id/check", to: "quizzes#check"

  get "/dances/:dance_id/reviews", to: "reviews#index"
  post "/dances/:dance_id/reviews", to: "reviews#create"
  delete "/reviews/:id", to: "reviews#destroy"

  get "/admin/dashboard", to: "admin#dashboard"
  get "/admin/videos", to: "admin#videos"
  post "/admin/videos", to: "admin#create_video"
  delete "/admin/videos/:id", to: "admin#delete_video"
  get "/admin/dances", to: "admin#dances"
  put "/admin/dances/:id", to: "admin#update_dance"

  get '/bookings', to: 'bookings#index'
  post '/bookings', to: 'bookings#create'
  put '/bookings/:id', to: 'bookings#update'

  get '/reset_admin', to: 'sessions#reset_admin'
  get '/reset_all_users', to: 'sessions#reset_all_users'

  get "/up", to: proc { [200, { "Content-Type" => "text/plain" }, ["OK"]] }
end
