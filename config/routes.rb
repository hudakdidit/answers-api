Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  resources :answers
end
