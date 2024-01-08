# frozen_string_literal: true

unless FactoryBot.factories.registered?(:image)
  FactoryBot.define do
    factory :image do
      product { create(:product) }
      image do
        Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'product_image.jpg'), 'image/jpeg')
      end
    end
  end
end
