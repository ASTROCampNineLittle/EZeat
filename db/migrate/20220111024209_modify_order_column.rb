class ModifyOrderColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :ticket_status, :string
    change_column :orders, :order_status, :string
  end
end