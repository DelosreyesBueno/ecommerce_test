# frozen_string_literal: true

# Esta es una breve descripción de la clase CreateImages.
# Es responsable de manejar la creación de imagenes en el sistema.

class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :product, foreign_key: true
      t.string :image
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.string :image_updated_at

      t.timestamps
    end
  end
end
