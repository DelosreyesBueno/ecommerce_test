# frozen_string_literal: true

require 'csv'

namespace :report do
  desc 'Task que envia diariamente las compras realizadas por cada producto'
  task generate_daily_purchase_report: :environment do
    yesterday = Date.today - 1
    start_date = yesterday.beginning_of_day
    end_date = yesterday.end_of_day

    products = Product.includes(:purchases)
                      .where(purchases: { created_at: start_date..end_date })

    csv_data = CSV.generate do |csv|
      csv << ['Producto', 'Numero compras por producto', 'Total ganancia']
      products.each do |product|
        purchases = product.purchases
        total_purchases_by_product = purchases.map(&:quantity).sum
        total_price_of_product = product.price * total_purchases_by_product

        csv << [product.name, total_purchases_by_product, total_price_of_product]
      end
    end

    SendEmailReportJob.perform_later(csv_data)
  end
end
