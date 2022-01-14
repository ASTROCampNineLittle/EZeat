class ModifyOrderColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :ticket_status, :ticket
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> e577931329dba497472daa22647603308ced8100
