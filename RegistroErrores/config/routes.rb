Rails.application.routes.draw do
  
  post 'information_error/generate_pdf'
  resources :programming_errors
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  #admnistrators
  get "/data_users", to: "users/administrators#index"
  get "/data_users/new", to: "users/administrators#new"
  get "/data_users/:id/edit(.:format)", to: "users/administrators#edit"
  post "/data_users/create", to: "users/administrators#create"
  post "/data_users/update", to: "users/administrators#update"
  delete "/data_users/:id(.:format)", :to => "users/administrators#destroy"

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
