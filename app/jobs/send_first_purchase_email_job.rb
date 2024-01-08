# frozen_string_literal: true

class SendFirstPurchaseEmailJob < ApplicationJob
  queue_as :default

  def perform(product_id)
    product = Product.find(product_id)

    PurchaseMailer.first_purchase_email(product).deliver_now
  end
end
