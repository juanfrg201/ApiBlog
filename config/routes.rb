Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :communities
      resources :blogs
      resources :comments, only: [:create, :index]
      resources :sessions, only: [:create, :destroy]
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations'
      }
      namespace :user do
        namespace :blogs do
          resources :user_blogs, only: [:index]
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
