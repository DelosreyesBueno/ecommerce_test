# frozen_string_literal: true

unless FactoryBot.factories.registered?(:product)
  FactoryBot.define do
    factory :product do
      name { Faker::Name.name }
      user { create(:admin) }
      product_type { 'Nuevo' }
      price { rand(1.0..500.0) }
      after(:create) do |product|
        product.categories << create(:category)
      end
    end
  end
end
