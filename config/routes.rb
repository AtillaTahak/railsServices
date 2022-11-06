# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          get '/:id', to: 'users#index'
          get 'find_user/:email', to: 'users#find_user',
                                  constraints: { email: %r{[^/]+} }, defaults: { format: 'json' }
        end
      end
    end
  end
end
