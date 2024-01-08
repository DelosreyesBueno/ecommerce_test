# frozen_string_literal: true

class SendEmailReportJob < ApplicationJob
  queue_as :default

  def perform(csv_report)
    PurchaseMailer.daily_purchase_report(csv_report).deliver_now
  end
end
