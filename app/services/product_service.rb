# frozen_string_literal: true

class ProductService
  def self.most_purchased_of_products
    most_selled_products = Product.select(
      'products.*, categories.name AS category_name, COUNT(purchases.id) AS purchases_count'
    )
                                  .joins(:categories)
                                  .left_joins(:purchases)
                                  .group('products.id, categories.name')
                                  .order('purchases_count DESC')

    most_purchased_products = {}
    most_selled_products.each do |category|
      category_name = category['category_name']
      product_info = {
        product_name: category['name']
      }
      most_purchased_products[category_name] ||= product_info
    end
    most_purchased_products
  end

  def self.three_most_profit_products
    most_profit_products = Product.select(
      'products.*, categories.name AS category_name, SUM(products.price * purchases.quantity) AS total_profit'
    )
                                  .joins(:categories)
                                  .left_joins(:purchases)
                                  .group('products.id, categories.name')
                                  .order('categories.name, total_profit DESC')

    profit_products = {}
    most_profit_products.each do |category|
      category_name = category['category_name']
      product_info = {
        product_name: category['name'],
        total_profit: category['total_profit'].to_f
      }

      profit_products[category_name] ||= []
      profit_products[category_name] << product_info
    end

    three_profit_products_by_category = {}
    profit_products.each do |category_name, prod_info|
      three_profit_product = prod_info.max_by(3) { |product| product[:total_profit] }
      three_profit_products_by_category[category_name] = three_profit_product
    end
    three_profit_products_by_category
  end
end
