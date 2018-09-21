Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  root to: 'home#index'
  post "/graphql", to: "graphql#execute"
  namespace :api, format: :json do
    namespace :v1 do
      resources :authors do
        resources :articles
      end
      resources :articles
    end
  end
  resources :authors
end
