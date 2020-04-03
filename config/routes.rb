Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :documents
  get '/about', to: 'home#about'
  root 'home#landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
