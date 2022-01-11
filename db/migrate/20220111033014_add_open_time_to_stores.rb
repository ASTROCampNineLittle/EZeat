class AddOpenTimeToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :open_time, :time
    add_column :stores, :close_time, :time
  end
end
