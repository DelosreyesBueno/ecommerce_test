# frozen_string_literal: true

# Esta es una breve descripción de la clase CreateProductsCategories.
# Es responsable de manejar la creación de la tabla ProductsCategories en el sistema.

class CreateProductsCategoriesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_products, id: false do |t|
      t.belongs_to :product
      t.belongs_to :category
    end
  end
end
