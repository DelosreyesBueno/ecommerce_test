# frozen_string_literal: true

class Purchase < ActiveRecord::Base
  after_create :send_purchase_confirmation_email

  belongs_to :product
  belongs_to :client, foreign_key: 'user_id'

  private

  def send_purchase_confirmation_email
    return unless product.purchases.count == 1

    SendFirstPurchaseEmailJob.perform_later(product.id)
  end
end
