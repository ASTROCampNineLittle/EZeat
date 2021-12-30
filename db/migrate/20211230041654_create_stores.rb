class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.integer :food_type
      t.string :tel
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :intro

      t.timestamps
    end
  end
end
