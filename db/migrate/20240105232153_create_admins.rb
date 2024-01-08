# frozen_string_literal: true

# Esta es una breve descripción de la clase CreateAdmins.
# Es responsable de manejar la creación de la tabla admins que hereda de User.

class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
