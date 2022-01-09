class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :open_date, null: false, foreign_key: true
      t.string :name
      t.string :tel
      t.string :email
      t.string :user_email
      t.string :order_dish
      t.string :order_number
      t.date :order_date
      t.string :order_time
      t.integer :order_people
      t.integer :ezeat_amount
      t.string :order_state
      t.integer :newebpay_amount, limit: 7
      t.string :newebpay_time
      t.integer :newebpay_number
      t.integer :newebpay_card6no, limit: 6
      t.timestamps
    end
  end
end