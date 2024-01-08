# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    return if validate_token_and_admin

    render json: { error: 'Token invalido' }, status: :unauthorized
  rescue JWT::DecodeError
    render json: { error: 'Token invalido' }, status: :unauthorized
  end

  def validate_token_and_admin
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = JWT.decode(token, nil, false, algorithm: 'HS256')
    decoded_token.first == Rails.application.credentials.jwt[:secret_key_base]
  end

  def validate_admin?
    user = User.find(params['user_id'])
    return if user.user_admin?

    render json: { error: 'Solo administradores pueden consumir esta API' }, status: :unauthorized
  end
end
