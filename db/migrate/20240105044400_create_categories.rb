# frozen_string_literal: true

# Esta es una breve descripción de la clase CreateCategories.
# Es responsable de manejar la creación de la tabla categorias.

class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
