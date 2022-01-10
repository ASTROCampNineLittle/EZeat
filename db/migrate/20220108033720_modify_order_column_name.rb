class ModifyOrderColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :order_name, :order_dish
  end
end