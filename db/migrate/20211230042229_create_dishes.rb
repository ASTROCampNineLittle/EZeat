class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.references :store, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.boolean :status
      t.text :intro

      t.timestamps
    end
  end
end
