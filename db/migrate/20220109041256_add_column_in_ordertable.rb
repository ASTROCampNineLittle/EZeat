class AddColumnInOrdertable < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :user_email, :string
  end
end