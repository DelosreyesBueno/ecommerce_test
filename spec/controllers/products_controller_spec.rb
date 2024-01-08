# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ProductsController, type: :controller do
  context 'Usuario administrador' do
    let(:admin_user) { create(:admin) }
    let(:bearer_token) { "Bearer #{JWT.encode(Rails.application.credentials.jwt[:secret_key_base], 'HS256')}" }

    describe '#most_purchased_products_by_category' do
      it 'devuelve un JSON con los productos más vendidos por categoría' do
        request.headers['Authorization'] = bearer_token
        get :most_purchased_products_by_category, params: { user_id: admin_user.id }

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to be_instance_of(Hash)
      end
    end

    describe '#three_most_profit_products_by_category' do
      it 'devuelve un JSON con los 3 productos con mayores ganancias por categoría' do
        request.headers['Authorization'] = bearer_token
        get :three_most_profit_products_by_category, params: { user_id: admin_user.id }

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to be_instance_of(Hash)
      end
    end
  end

  context 'Usuario no administrador' do
    let(:client_user) { create(:client) }
    let(:bearer_token) { "Bearer #{JWT.encode(Rails.application.credentials.jwt[:secret_key_base], 'HS256')}" }

    describe '#most_purchased_products_by_category' do
      it 'devuelve un JSON con los productos más vendidos por categoría' do
        request.headers['Authorization'] = bearer_token
        get :most_purchased_products_by_category, params: { user_id: client_user.id }

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Solo administradores pueden consumir esta API')
      end
    end

    describe '#three_most_profit_products_by_category' do
      it 'devuelve un JSON con los 3 productos con mayores ganancias por categoría' do
        request.headers['Authorization'] = bearer_token
        get :three_most_profit_products_by_category, params: { user_id: client_user.id }

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Solo administradores pueden consumir esta API')
      end
    end
  end

  context 'Token incorrecto' do
    let(:admin_user) { create(:admin) }
    let(:bearer_token) { "Bearer #{JWT.encode('User123456', 'HS256')}" }

    describe '#most_purchased_products_by_category' do
      it 'returns a JSON with the most sold products by category' do
        get :most_purchased_products_by_category, params: { user_id: admin_user.id }

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Token invalido')
      end
    end

    describe '#three_most_profit_products_by_category' do
      it 'returns a JSON with the top 3 profit products by category' do
        get :three_most_profit_products_by_category, params: { user_id: admin_user.id }

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Token invalido')
      end
    end
  end
end
