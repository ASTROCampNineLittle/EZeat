class AddUserIdToCompany < ActiveRecord::Migration[6.1]
  def change
    add_reference :companies, :user, null: false, foreign_key: true
  end
end
