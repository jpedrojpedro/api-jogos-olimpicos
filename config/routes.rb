Rails.application.routes.draw do
  namespace :api do
    resources :competitions, param: :slug, only: :index do
      resources :modalities, param: :slug, only: :index do
        resources :stages, only: :index do
          resources :batteries, only: :index
        end
      end
    end
  end
end
