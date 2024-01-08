# frozen_string_literal: true

# Esta es una breve descripción de la clase CreateClients.
# Es responsable de manejar la creación de la tabla clientes.

class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
