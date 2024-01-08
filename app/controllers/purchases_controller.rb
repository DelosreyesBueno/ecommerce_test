# frozen_string_literal: true

class PurchasesController < ApplicationController
  before_action :validate_admin?, only: %i[purchase_list]

  def purchase_list
    result = PurchaseService.purchase_list(params)
    render json: result
  end
end
