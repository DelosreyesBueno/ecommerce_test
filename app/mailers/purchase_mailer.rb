# frozen_string_literal: true

class PurchaseMailer < ApplicationMailer
  default from: 'ecommerce_notifications@example.com'

  def first_purchase_email(product)
    @product = product

    mail(
      to: @product.user.email,
      subject: "Se realizo la primera compra del siguiente producto: #{@product.name}",
      cc: Admin.get_admin_except_one_email(@product.user)
    ) do |format|
      format.html { render 'first_purchase_email' }
    end
  end

  def daily_purchase_report(csv)
    attachments['reporte.csv'] = csv
    mail(
      to: Admin.get_all_admin_emails,
      subject: 'Informe CSV adjunto'
    ) do |format|
      format.html { render 'daily_purchase_report' }
    end
  end
end
