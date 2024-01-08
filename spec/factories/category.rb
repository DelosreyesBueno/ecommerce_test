# frozen_string_literal: true

unless FactoryBot.factories.registered?(:category)
  FactoryBot.define do
    factory :category do
      name { Faker::Name.name }
      user { create(:admin) }
    end
  end
end
