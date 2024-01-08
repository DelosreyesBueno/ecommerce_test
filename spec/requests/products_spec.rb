# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'products', type: :request do
  path '/three_most_profit_products_by_category' do
    get('three_most_profit_products_by_category product') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/most_purchased_products_by_category' do
    get('most_purchased_products_by_category product') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
