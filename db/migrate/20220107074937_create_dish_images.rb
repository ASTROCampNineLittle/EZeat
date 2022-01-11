class CreateDishImages < ActiveRecord::Migration[6.1]
  def change
    create_table :dish_images do |t|
      t.integer :dish_id, index: true
      t.string :image
      t.timestamps
    end
  end
end
