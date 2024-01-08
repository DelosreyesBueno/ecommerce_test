# frozen_string_literal: true

# Esta es una breve descripción de la clase CreateProducts.
# Es responsable de manejar la creación de la tabla productos.

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false, default: 0
      t.string :product_type, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
