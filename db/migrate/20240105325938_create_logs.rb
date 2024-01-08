# frozen_string_literal: true

# Esta es una breve descripción de la clase CreateLogs.
# Es responsable de manejar la creación de la tabla logs.

class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.string :model_type, null: false
      t.integer :model_id
      t.string :log_type, null: false
      t.text :log_changes

      t.timestamps
    end
  end
end
