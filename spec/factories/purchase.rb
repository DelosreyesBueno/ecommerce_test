# frozen_string_literal: true

unless FactoryBot.factories.registered?(:purchase)
  FactoryBot.define do
    factory :purchase do
      product { create(:product) }
      user { create(:client) }
      quantity { rand(1..10) }
    end
  end
end
