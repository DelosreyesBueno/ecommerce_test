# frozen_string_literal: true

# Esta es una breve descripción de la clase CreateUsers.
# Es responsable de manejar la creación de la tabla usuarios.

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :type

      t.timestamps
    end
  end
end
