class ChangeOrdertableIntegerLimit < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :newebpay_amount, :integer, limit: 7
    change_column :orders, :newebpay_card6no, :integer, limit: 6
  end
end