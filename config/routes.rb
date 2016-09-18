Rails.application.routes.draw do

  root_directory = Rails.application.config.root_directory rescue '/'

  scope root_directory do
    root "home#index"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end

end
