# frozen_string_literal: true

# ==> Sidekiq
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'three_most_profit_products_by_category', to: 'products#three_most_profit_products_by_category'
  get 'most_purchased_products_by_category', to: 'products#most_purchased_products_by_category'
  get 'purchase_list', to: 'purchases#purchase_list'
end
