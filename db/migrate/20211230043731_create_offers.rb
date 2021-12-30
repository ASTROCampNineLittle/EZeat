class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :open_date, null: false, foreign_key: true
      t.time :availible_time
      t.integer :capacity

      t.timestamps
    end
  end
end
