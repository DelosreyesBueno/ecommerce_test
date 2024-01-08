# frozen_string_literal: true

unless FactoryBot.factories.registered?(:admin)
  FactoryBot.define do
    factory :admin do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      password { 'password' }
    end
  end
end
