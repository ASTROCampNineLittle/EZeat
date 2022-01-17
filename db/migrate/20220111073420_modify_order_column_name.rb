class ModifyOrderColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :ticket_status, :ticket
  end
end