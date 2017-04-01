Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      resources :answers, :users
      post 'graphql', to: 'graphql#query'
      mount GraphiQL::Rails::Engine, at: "graphiql", graphql_path: "graphql" if Rails.env.development?
    end
  end
end
