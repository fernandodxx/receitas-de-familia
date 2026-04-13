Rails.application.routes.draw do
  root 'recipes#index'

  resources :recipes, param: :slug do
    resources :comments, only: [:create]
  end

  get 'regiao/:region', to: 'recipes#by_region', as: :region
  get 'ocasiao/:occasion', to: 'recipes#by_occasion', as: :occasion
  get 'categoria/:category', to: 'recipes#by_category', as: :category
  get 'buscar', to: 'recipes#search', as: :search

  get "up" => "rails/health#show", as: :rails_health_check
end
