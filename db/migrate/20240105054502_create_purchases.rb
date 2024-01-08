# frozen_string_literal: true

# Esta es una breve descripción de la clase CreatePurchases.
# Es responsable de manejar la creación de la tabla purchases.

class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.references :product, foreign_key: true
      t.integer :user_id
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
