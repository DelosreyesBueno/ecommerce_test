# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PurchasesController, type: :controller do
  context 'Usuario administrador' do
    let(:bearer_token) { "Bearer #{JWT.encode(Rails.application.credentials.jwt[:secret_key_base], 'HS256')}" }
    let(:admin_user) { create(:admin) }
    let(:client_user) { create(:client) }
    let(:category) { create(:category, user_id: admin_user.id) }

    describe '#purchase_list' do
      it 'retorna un JSON con la lista de compras' do
        product = Product.new(name: Faker::Name.name, user: admin_user, price: rand(1.0..500.0), product_type: 'Nuevo')
        product.categories << category
        product.save
        Purchase.create(client: client_user, product: product, quantity: rand(1..10))

        request.headers['Authorization'] = bearer_token

        get :purchase_list, params: {
          user_id: admin_user.id,
          admin_id: admin_user.id,
          category_id: category.id,
          client_id: client_user.id,
          start_date: Date.today,
          end_date: Date.today
        }

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body).count).to be(1)
      end
    end
  end

  context 'Usuario no administrador' do
    let(:bearer_token) { "Bearer #{JWT.encode(Rails.application.credentials.jwt[:secret_key_base], 'HS256')}" }
    let(:admin_user) { create(:admin) }
    let(:client_user) { create(:client) }
    let(:category) { create(:category, user_id: admin_user.id) }

    describe '#most_purchased_products_by_category' do
      it 'retorna un JSON con la lista de compras, error en usuario administrador' do
        product = Product.new(name: Faker::Name.name, user: admin_user, price: rand(1.0..500.0), product_type: 'Nuevo')
        product.categories << category
        product.save
        Purchase.create(client: client_user, product: product, quantity: rand(1..10))

        request.headers['Authorization'] = bearer_token

        get :purchase_list, params: {
          user_id: client_user.id,
          admin_id: admin_user.id,
          category_id: category.id,
          client_id: client_user.id,
          start_date: Date.today,
          end_date: Date.today
        }

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Solo administradores pueden consumir esta API')
      end
    end
  end

  context 'Token incorrecto' do
    let(:admin_user) { create(:admin) }
    let(:client_user) { create(:client) }
    let(:category) { create(:category, user_id: admin_user.id) }
    let(:bearer_token) { "Bearer #{JWT.encode('User123456', 'HS256')}" }

    describe '#most_purchased_products_by_category' do
      it 'retorna un JSON con la lista de compras, error en token incorrecto' do
        get :purchase_list, params: {
          user_id: admin_user.id,
          admin_id: client_user.id,
          category_id: category.id,
          client_id: client_user.id,
          start_date: Date.today,
          end_date: Date.today
        }

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Token invalido')
      end
    end
  end
end
