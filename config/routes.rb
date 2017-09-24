Rails.application.routes.draw do
  namespace :api do
    resources :competitions, param: :slug, only: :index do
      resources :modalities, param: :slug, only: :index do
        resources :stages, param: :slug, only: :index do
          resources :batteries, param: :number, only: :index do
            resources :results, only: %i[index create]
          end
        end
      end
    end
  end
end
