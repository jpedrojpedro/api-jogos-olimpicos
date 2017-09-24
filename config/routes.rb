Rails.application.routes.draw do
  namespace :api do
    resources :modalities, only: :index do
      resources :competitions, only: :index do
        resources :stages, only: :index do
          resources :batteries, only: :index
        end
      end
    end
  end
end
