class DropOrderTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :orders
  end
end