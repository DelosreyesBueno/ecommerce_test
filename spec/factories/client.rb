# frozen_string_literal: true

unless FactoryBot.factories.registered?(:client)
  FactoryBot.define do
    factory :client do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      password { 'password' }
    end
  end
end
