# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :validate_admin?, only: %i[most_purchased_products_by_category three_most_profit_products_by_category]

  def most_purchased_products_by_category
    result = ProductService.most_purchased_of_products
    render json: result
  end

  def three_most_profit_products_by_category
    result = ProductService.three_most_profit_products
    render json: result
  end
end
