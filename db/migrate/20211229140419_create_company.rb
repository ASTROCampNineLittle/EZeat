class CreateCompany < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|

      t.string :name
      t.string :address
      t.string :tel
      t.string :manager_name

      t.timestamps
    end
  end
end
