# frozen_string_literal: true

class PurchaseService
  def self.purchase_list(purchase_params)
    category_id = purchase_params[:category_id]
    start_date = purchase_params[:start_date].to_date.beginning_of_day
    end_date = purchase_params[:end_date].to_date.end_of_day
    admin_id = purchase_params[:admin_id]
    client_id = purchase_params[:client_id]

    Purchase.select(
      'purchases.*'
    )
            .joins(product: :categories)
            .where('categories.id = ?', category_id)
            .where('products.user_id = ?', admin_id)
            .where('purchases.user_id = ?', client_id)
            .where(created_at: start_date..end_date)
  end
end
