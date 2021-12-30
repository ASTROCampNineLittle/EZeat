class CreateOpenDates < ActiveRecord::Migration[6.1]
  def change
    create_table :open_dates do |t|
      t.references :dish, null: false, foreign_key: true
      t.date :availible_date

      t.timestamps
    end
  end
end
